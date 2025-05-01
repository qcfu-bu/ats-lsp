const node = require('vscode-languageserver/node');
const text = require('vscode-languageserver-textdocument');

// -------------------------------------------------------------------

// diagnostic severity
function diagnostic_severity$error() {
  return node.DiagnosticSeverity.Error;
}

function diagnostic_severity$warn() {
  return node.DiagnosticSeverity.Warning;
}

function diagnostic_severity$hint() {
  return node.DiagnosticSeverity.Hint;
}

function diagnostic_severity$info() {
  return node.DiagnosticSeverity.Information;
}

// position
function position$mk(line, offs) {
  return { 
    line: line, 
    character: offs 
  };
}

// diagnostic
function diagnostic$mk(severity, start, end, message, source) {
  return { 
    severity: severity,
    range: {
      start: start,
      end: end
    },
    message: message,
    source: source
  };
}

// -------------------------------------------------------------------

const connection = node.createConnection(node.ProposedFeatures.all);
const documents = new node.TextDocuments(text.TextDocument);

console.log = connection.console.log.bind(connection.console);
console.error = connection.console.error.bind(connection.console);

let hasConfigurationCapability = false;
let hasWorkspaceFolderCapability = false;
let hasDiagnosticRelatedInformationCapability = false;

/**
 * @param {node.InitializeParams} params 
 */
connection.onInitialize((params) => {
  const capabilities = params.capabilities;

  hasConfigurationCapability = !!(
    capabilities.workspace && !!capabilities.workspace.configuration
  );
  hasDiagnosticRelatedInformationCapability = !!(
    capabilities.textDocument &&
    capabilities.textDocument.publishDiagnostics &&
    capabilities.textDocument.publishDiagnostics.relatedInformation
  );

  const result = {
    capabilities: {
      textDocumentSyntax: node.TextDocumentSyncKind.Incremental,
			completionProvider: {
				resolveProvider: true
			},
      diagnosticProvider: {
				interFileDependencies: false,
				workspaceDiagnostics: false
      }
    }
  };
  if (hasWorkspaceFolderCapability) {
    result.capabilities.workspace = {
      workspaceFolders: {
        supported: true
      }
    }
  };
  return result;
});

connection.onInitialized(() => {
  console.log("ok");
  if (hasConfigurationCapability) {
    connection.client.register(node.DidChangeConfigurationNotification.type, undefined);
  }
  if (hasWorkspaceFolderCapability) {
    connection.workspace.onDidChangeWorkspaceFolders(_event => {
      connection.console.log("Workspace folder change event received.")
    });
  }
});

function asyncValidatorWrap(validator) {
  async function asyncValidator(textDocument) {
    return validator(textDocument.uri);
  };
  return asyncValidator;
}

function bootstrap$validator(validator) {
  const asyncValidator = asyncValidatorWrap(validator); 
  connection.languages.diagnostics.on(async (params) => {
    const document = documents.get(params.textDocument.uri);
    if (document !== undefined) {
      return {
        kind: node.DocumentDiagnosticReportKind.Full,
        items: await asyncValidator(document)
      };
    } else {
      return {
        kind: node.DocumentDiagnosticReportKind.Full,
        items: []
      }
    }
  });
  documents.onDidChangeContent(async (change) => {
    return asyncValidator(change.document);
  });
}

function bootstrap$connect() {
  documents.listen(connection);
  connection.listen();
}

const node = require('vscode-languageserver/node');
const text = require('vscode-languageserver-textdocument');
const url = require('url');

// -------------------------------------------------------------------

// url to file path
function vscode_url_to_path(uri) {
  return url.fileURLToPath(uri);
}

// diagnostic severity
function vscode_severity_error$make() {
  return node.DiagnosticSeverity.Error;
}

function vscode_severity_warn$make() {
  return node.DiagnosticSeverity.Warning;
}

function vscode_severity_hint$make() {
  return node.DiagnosticSeverity.Hint;
}

function vscode_severity_info$make() {
  return node.DiagnosticSeverity.Information;
}

// position
function vscode_position_make(line, offs) {
  return { 
    line: line, 
    character: offs 
  };
}

// range
function vscode_range_make(pbeg, pend) {
  return { 
    start: pbeg, 
    end: pend 
  };
}

// diagnostic
function vscode_diagnostic_make(severity, range, message, source) {
  return { 
    severity: severity,
    range: range,
    message: message,
    source: source
  };
}

// diagnostics
function vscode_diagnostics_push(diagnostics, d) {
  diagnostics.push(d);
}

// -------------------------------------------------------------------

const connection = node.createConnection(node.ProposedFeatures.all);
const documents = new node.TextDocuments(text.TextDocument);

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
			// completionProvider: {
			// 	resolveProvider: true
			// },
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
    let diagnostics = [];
    validator(diagnostics, textDocument.uri);
    return diagnostics;
  };
  return asyncValidator;
}

function vscode_set_validator(validator) {
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
  documents.onDidSave(change => {
    asyncValidator(change.document);
    connection.languages.diagnostics.refresh()
  });
}

function vscode_connect() {
  documents.listen(connection);
  connection.listen();
}

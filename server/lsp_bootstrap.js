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

// regex
function vscode_regex_make(pattern) {
  return new RegExp(pattern);
}

function vscode_regex_test(re, input) {
  return re.test(input);
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
    connection.sendDiagnostics({ uri: textDocument.uri, diagnostics });
  };
  return asyncValidator;
}

function vscode_set_validator(validator) {
  const asyncValidator = asyncValidatorWrap(validator); 
  connection.onDidChangeConfiguration(_change => {
    documents.all().forEach(asyncValidator);
  });
  documents.onDidSave(change => {
	  asyncValidator(change.document);
  });
}

function vscode_connect() {
  documents.listen(connection);
  connection.listen();
}

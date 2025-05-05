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

// dependencies
function JS_depset_make() {
  return new Set();
}

/**
 * @param {Set} dp 
 */
function JS_depset_add(dp, k) {
  dp.add(k);
}

/**
 * @param {Set} dp 
 */
function JS_depset_pop(dp) {
  const [elem] = dp;
  dp.delete(elem);
  return elem;
}

/**
 * @param {Set} dp 
 */
function JS_depset_is_empty(dp) {
  return (dp.size <= 0);
}

/**
 * @param {Set} dp1
 * @param {Set} dp2
 */
function JS_depset_union(dp1, dp2) {
  return dp1.union(dp2);
}

/**
 * @param {Map<Any,Set<Any>>} dp 
 */
function JS_depgraph_add(dp, k, v) {
  const edges = dp.get(k)
  if (edges !== undefined) {
    edges.add(v);
  } else {
    dp.set(k, new Set([v]));
  }
}

/**
 * @param {Map<Any,Set<Any>>} dp 
 */
function JS_depgraph_delete(dp, k) {
  dp.delete(k);
}

/**
 * @param {Map<Any,Set<Any>>} dp 
 */
function JS_depgraph_find(dp, k) {
  const edges = dp.get(k);
  if (edges === undefined) {
    return new Set();
  } else {
    return edges;
  }
}


// FIXME: 
// The ats compiler library does not provide an api to prune cached staload files. 
// We will use JS to prune caches directly.
function JS_map_reset(env, key) {
  let v = env[key];
  if (v !== undefined) {
    delete env[key];
  }
}

// -------------------------------------------------------------------

const connection = node.createConnection(node.ProposedFeatures.all);
const documents = new node.TextDocuments(text.TextDocument);

let hasConfigurationCapability = false;
let hasWorkspaceFolderCapability = false;
let hasDiagnosticRelatedInformationCapability = false;
let diagnostics = [];
let dependencies = new Map();

// FIXME: 
// The ats compiler library does not provide an api to prune cached staload files. 
// We will use JS to prune caches directly.
function vscode_initialize(validator, pruner) {
  function textValidator(textDocument) {
    diagnostics = [];
    validator(dependencies, diagnostics, textDocument.uri);
    connection.sendDiagnostics({ uri: textDocument.uri, diagnostics });
  };

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

  connection.onDidChangeConfiguration(_change => {
    documents.all().forEach(textValidator);
  });

  documents.onDidOpen(change => {
	  textValidator(change.document);
  });

  documents.onDidSave(change => {
	  textValidator(change.document);
  });

  documents.onDidChangeContent(change => {
    pruner(dependencies, change.document.uri);
  })

  documents.listen(connection);
  connection.listen();
}

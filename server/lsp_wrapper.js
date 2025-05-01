const node = require('vscode-languageserver/node');
const text = require('vscode-languageserver-textdocument');

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

connection.languages.diagnostics.on(async (params) => {
  const document = documents.get(params.textDocument.uri);
  if (document !== undefined) {
    return {
      kind: node.DocumentDiagnosticReportKind.Full,
      items: await validateTextDocument(document)
    };
  } else {
    return {
      kind: node.DocumentDiagnosticReportKind.Full,
      items: []
    }
  }
});

/**
 * @param {text.TextDocument} change
 */
documents.onDidChangeContent(change => {
  validateTextDocument(change.document);
})

async function validateTextDocument(textDocument) {
  console.log(textDocument.uri);
  const diagnostic = {
    serverity: node.DiagnosticSeverity.Error,
    range: {
      start: textDocument.positionAt(0),
      end: textDocument.positionAt(1),
    },
    message: `something`,
    source: 'ex'
  };
  if (hasDiagnosticRelatedInformationCapability) {
    diagnostic.relatedInformation = [
      {
        location: {
          uri: textDocument.uri,
          range: Object.assign({}, diagnostic.range)
        },
        message: 'Spelling matters'
      },
      {
        location: {
          uri: textDocument.uri,
          range: Object.assign({}, diagnostic.range)
        },
        message: 'Particularly for names'
      }
    ];
  }
  const diagnostics = [];
  diagnostics.push(diagnostic);
  return diagnostics;
}

documents.listen(connection);
connection.listen();

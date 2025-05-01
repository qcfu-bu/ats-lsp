const path = require('path');
const vscode = require('vscode');
const node = require('vscode-languageclient/node');

let client = null;

/**
 * @param {vscode.ExtensionContext} context
 */
function activate(context) {
  console.log("Client starting.")

  const serverModule = context.asAbsolutePath(
    path.join('server', 'out', "server.js")
  );

  const serverOptions = {
    run: { module: serverModule, transport: node.TransportKind.ipc },
    debug: {
      module: serverModule,
      transport: node.TransportKind.ipc
    }
  };

  const clientOptions = {
    documentSelector: [{ scheme: 'file', language: 'ats' }],
    synchronize: {
      fileEvents: vscode.workspace.createFileSystemWatcher('../.clientrc')
    }
  };

  client = new node.LanguageClient(
    'languageServer',
    'ATS Language Server',
    serverOptions,
    clientOptions
  );

  client.start();
}

function deactivate() {
  if (!client) {
    return undefined;
  }
  return client.stop();
}

module.exports = {
  activate,
  deactivate,
};
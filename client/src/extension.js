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
    path.join('server', 'out', "ats_lsp_out.js")
  );

  const serverOptions = {
      module: serverModule, 
      transport: node.TransportKind.ipc,
      options: {
        execArgv: ['--stack-size=8192'],
      }
  };

  const clientOptions = {
    documentSelector: [{ scheme: 'file', language: 'ats' }],
    synchronize: {
      fileEvents: vscode.workspace.createFileSystemWatcher('**/*.(sats)|(dats)|(hats)')
    }
  };

  client = new node.LanguageClient(
    'ATSLanguageServer',
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
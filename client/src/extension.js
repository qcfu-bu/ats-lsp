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
    path.join('server', 'out', "ats_lsp_out1.js")
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

  if (vscode.workspace.getConfiguration('ats-lsp').get('enabled')) {
    client = new node.LanguageClient(
      'ats-lsp',
      'ATS Language Server',
      serverOptions,
      clientOptions
    );
    client.start();
  }

  context.subscriptions.push(
    vscode.commands.registerCommand('ats-lsp.startServer', () => {
      if (!vscode.workspace.getConfiguration('ats-lsp').get('enabled')) {
        vscode.window.showInformationMessage('ATS Language Server is disabled in workspace.');
        return;
      }
      if (!client) {
        client = new node.LanguageClient(
          'ats-lsp',
          'ATS Language Server',
          serverOptions,
          clientOptions
        );
        client.start();
      } else {
        vscode.window.showInformationMessage('ATS Language Server is already running.');
      }
    })
  );

  context.subscriptions.push(
    vscode.commands.registerCommand('ats-lsp.stopServer', () => {
      if (!vscode.workspace.getConfiguration('ats-lsp').get('enabled')) {
        vscode.window.showInformationMessage('ATS Language Server is disabled in workspace.');
        return;
      }
      if (client) {
        client.stop();
        client = null;
      } else {
        vscode.window.showInformationMessage('ATS Language Server is not running.');
      }
    })
  );

  context.subscriptions.push(
    vscode.commands.registerCommand('ats-lsp.restartServer', () => {
      if (!vscode.workspace.getConfiguration('ats-lsp').get('enabled')) {
        vscode.window.showInformationMessage('ATS Language Server is disabled in workspace.');
        return;
      }
      if (client) {
        client.stop();
        client = null;
      }
      client = new node.LanguageClient(
        'ats-lsp',
        'ATS Language Server',
        serverOptions,
        clientOptions
      );
      client.start();
      vscode.window.showInformationMessage('ATS Language Server restarted.');
    })
  );
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
// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as path from 'path';
import * as vscode from 'vscode';
import { LanguageClient, TransportKind } from 'vscode-languageclient/node';


let client;

// This method is called when your extension is activated
// Your extension is activated the very first time the command is executed

/**
 * @param {vscode.ExtensionContext} context
 */
export function activate(context) {
  const serverModule = context.asAbsolutePath(
    path.join('server', 'out', "server.js")
  );

  const serverOptions = {
    run: { module: serverModule, transport: TransportKind.ipc },
    debug: {
      module: serverModule,
      transport: TransportKind.ipc
    }
  };

  const clientOptions = {
    documentSelector: [{ scheme: 'file', language: 'ats' }],
    synchronize: {
      fileEvents: vscode.workspace.createFileSystemWatcher('../.clientrc')
    }
  };

  client = new LanguageClient(
    'atsLanguageServer',
    'ATS LanguageServer',
    serverOptions,
    clientOptions
  );

  client.start();
}

// This method is called when your extension is deactivated
export function deactivate() {
  if (!client) {
    return undefined;
  }
  return client.stop();
}
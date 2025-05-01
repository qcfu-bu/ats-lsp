import * as path from 'path';
import * as vscode from 'vscode';
import { LanguageClient, TransportKind } from 'vscode-languageclient/node';

let client;

/**
 * @param {vscode.ExtensionContext} context
 */
export function activate(context) {
  console.log("Client starting.")

  const serverModule = context.asAbsolutePath(
    path.join('server', 'out', "ats_lsp_out.js")
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

export function deactivate() {
  if (!client) {
    return undefined;
  }
  return client.stop();
}
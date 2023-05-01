import 'package:flutter/material.dart';
import 'package:walletconnect_qrcode_modal_dart/walletconnect_qrcode_modal_dart.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';
import 'global.dart';
import 'dart:async';

class WalletConnectObserver extends WidgetsBindingObserver {
  final VoidCallback onAppResumed;

  WalletConnectObserver({required this.onAppResumed});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        onAppResumed();
      });
    }
  }
}

/// Initalize a provider, you must supply: context to display modal, bridge url, app name, app description, your app url, and icon to display on connection.
Future<void> initializeProvider(BuildContext context, String bridge,
    String name, String description, String url, String icon) async {
  // Create a Completer for waiting until the app is resumed
  Completer<void> appResumedCompleter = Completer();

  // Create a WalletConnectObserver and add it to the WidgetsBinding
  WalletConnectObserver observer = WalletConnectObserver(onAppResumed: () {
    appResumedCompleter.complete();
  });
  WidgetsBinding.instance?.addObserver(observer);
  // Create a connector
  walletModal = WalletConnectQrCodeModal(
    connector: WalletConnect(
      /// <-- Your bridge url
      bridge: bridge,
      clientMeta: PeerMeta(
        // <-- Meta data of your app appearing in the wallet when connecting
        name: name,
        description: description,
        url: url,
        icons: [icon],
      ),
    ),
  );
  walletModal?.registerListeners(
    onConnect: (session) => print('Connected: $session'),
    onSessionUpdate: (response) => print('Session updated: $response'),
    onDisconnect: () => print('Disconnected'),
  );
  final session = await walletModal?.connect(context).catchError((error) {
    print('Error: $error');
    return null;
  });
  await appResumedCompleter.future;

  // Create a provider and set it to the global variable
  ethereumProvider = EthereumWalletConnectProvider(walletModal!.connector);
  final sender = EthereumAddress.fromHex(session!.accounts[0]);
  // set address to global variable
  address = sender.hexEip55;
  WidgetsBinding.instance?.removeObserver(observer);
}

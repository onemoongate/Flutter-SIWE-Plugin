import 'package:flutter/material.dart';
import 'package:walletconnect_qrcode_modal_dart/walletconnect_qrcode_modal_dart.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';
import 'global.dart';

/// Initalize a provider, you must supply: context to display modal, bridge url, app name, app description, your app url, and icon to display on connection.
Future<void> initializeProvider(BuildContext context, String bridge,
    String name, String description, String url, String icon) async {
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

  // Create a provider and set it to the global variable
  ethereumProvider = EthereumWalletConnectProvider(walletModal!.connector);
  final sender = EthereumAddress.fromHex(session!.accounts[0]);
  // set address to global variable
  address = sender.hexEip55;
}

import 'package:walletconnect_qrcode_modal_dart/walletconnect_qrcode_modal_dart.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';
import 'global.dart';

Future<void> signMessage(message) async {
  if (ethereumProvider == null) {
    print('Error: Ethereum provider is not initialized');
  } else {
    try {
      await walletModal?.openWalletApp();
      signature = await ethereumProvider?.personalSign(
          message: message, address: address ?? '', password: '');
    } catch (error) {}
  }
}

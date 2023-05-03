import 'global.dart';

Future<void> signMessage(message) async {
  if (ethereumProvider == null) {
    print('Error: Ethereum provider is not initialized');
  } else {
    try {
      await walletModal?.openWalletApp();
      signature = await ethereumProvider?.personalSign(
          message: message, address: address ?? '', password: '');
    } catch (error) {
      print('Error: $error');
    }
  }
}

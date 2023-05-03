import 'package:flutter_test/flutter_test.dart';
import 'package:siwe_flutter/create_message.dart';

createMessageTest() {
  group('createMessage', () {
    test('should return the formatted message', () {
      const domain = "example.com";
      const address = "0x742d35Cc6634C0532925a3b844Bc454e4438f44e";
      const statement = "Example statement";
      const uri = "https://example.com/login";
      const version = "2";
      const chainId = "1";
      const nonce = "8a8a3edfc6b575c3";
      final message = createMessage(domain, statement, uri, version, chainId);

      const expectedStartsWith =
          "$domain wants you to sign in with your Ethereum account:\n$address\n\n$statement\n\nURI: $uri\nVersion: $version\nChain ID: $chainId\nNonce: $nonce\nIssued At: ";

      expect(message.startsWith(expectedStartsWith), isTrue);
      // log the message for manual verification
    });
  });
}

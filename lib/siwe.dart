// Create message to sign with nonce
import 'package:siwe_flutter/library.dart';

import 'create_message.dart';
import 'sign_message.dart';

// Sign message
Future<void> signInWithEthereum(
    domain, statement, uri, version, chainId) async {
  // Create message to sign with nonce
  final message = createMessage(domain, statement, uri, version, chainId);
  // Sign message
  await signMessage(message);
}

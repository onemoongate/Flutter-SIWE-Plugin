// Create message to sign with
import 'create_message.dart';
import 'sign_message.dart';

// Sign message
Future<void> signInWithEthereum(String domain, String statement, String uri,
    String version, String chainId) async {
  // Create message to sign with nonce
  final message = createMessage(domain, statement, uri, version, chainId);
  // Sign message
  await signMessage(message);
}

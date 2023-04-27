/// Create a compatible message for signing for default provider.
import 'global.dart';

createMessage(domain, statement, uri, version, chainId) {
  // Address must be EIP55 compliant, if using web3dart, use the hexEip55 method.
  DateTime now = DateTime.now();
  int millisecondsSinceEpoch = now.millisecondsSinceEpoch;
  String iso8601 = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)
      .toIso8601String();
  // Remove microseconds from the ISO 8601 string
  int indexOfDot = iso8601.indexOf('.');
  String iso8601WithoutMicroseconds =
      iso8601.substring(0, indexOfDot + 4) + 'Z';
// final message
  final message =
      "$domain wants you to sign in with your Ethereum account:\n$address\n\n$statement\n\nURI: $uri\nVersion: $version\nChain ID: $chainId\nNonce: $nonce\nIssued At: $iso8601WithoutMicroseconds";
  payload = {
    "domain": domain,
    "address": address,
    "statement": statement,
    "uri": uri,
    "version": version,
    "chainId": chainId,
    "nonce": nonce,
    "issuedAt": iso8601WithoutMicroseconds
  };
  return message;
}

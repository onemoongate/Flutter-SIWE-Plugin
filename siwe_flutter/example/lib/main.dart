import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:siwe_flutter/library.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        // ... other locales the app supports
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: _ConnectWalletButton(),
        ),
      ),
    );
  }
}

class _ConnectWalletButton extends StatefulWidget {
  @override
  __ConnectWalletButtonState createState() => __ConnectWalletButtonState();
}

class __ConnectWalletButtonState extends State<_ConnectWalletButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // First initalize the provider, must supply context.
        await initializeProvider(
          context,
          "https://bridge.walletconnect.org",
          'MoonGate',
          'An example app showcasing Sign in With Ethereum',
          'localhost:3000',
          'https://www.joinef.com/wp-content/uploads/2023/03/MoonGate-5-Praneet-Sinha-700x700.png',
        );
        // Get nonce from SIWE backend.
        await getNonce("http://192.168.0.30:3001/api/nonce");
        // Sign in with Ethereum.
        await signInWithEthereum(
            'localhost:3000', 'I love pizza', 'localhost:3000', '1', '1');
        // Verify the signature.
        await verifyMessage('http://192.168.0.30:3001/verify');
      },
      child: Text('Connect wallet'),
    );
  }
}

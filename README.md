# SIWE Flutter (Sign in With Ethereum for Flutter)

[Sign-In with Ethereum](login.xyz) is a form of authentication that enables users to control their digital identity with their Ethereum account and ENS profile instead of relying on a traditional intermediary. SIWE Flutter is a Flutter plugin that allows you to integrate SIWE authentication inside your Flutter app. 

## What this plugin does

This plugin is an implementation of SIWE for the frontend of your app. It allows you to: 
- Initalize and connect a wallet provider using WalletConnect.
- Create & Sign SIWE message with a user's Ethereum wallet.
- Send SIWE message to a backend server for verification.

For more details on how SIWE works, please refer to the [SIWE documentation](https://docs.login.xyz/).
## Getting Started
There are two ways to use the plugin, either using the default provider (walletconnect) or by bringing your own provider. We recommend using the default provider as it is easier to use and requires less setup time overall.
Please look at the example app for a working example of the plugin using the default provider.
### Using the default provider
- Initalize and connect a wallet provider using:

    ```dart
    initializeEthereumProvider(BuildContext context, String bridge,
        String name, String description, String url, String icon)
    ```
Context is required to bring the modal pop-up on screen.
The rest of the parameters are required to initalize the WalletConnect provider.

- Get nonce from backend server:

    ```dart
    getNonce(String url)
    ```

- Sign SIWE message:

    ```dart
    signInWithEthereum(
    String domain,String statement,String uri, String version,String chainId)
    ```
- Verify Message:
    ```dart 
        verifyMessage(String url)
    ```
### Using your own provider

- Initalize your own provider
- Get nonce from backend server
  ```dart
    getNonce(String url)
    ```
- Create a message using createExternalMessage()
    ```dart
        createExternalMessage(String domain,String statement,String uri, String version,String chainId)
    ```
- Sign the message using personal sign message with returned message from createExternalMessage()

Many thanks to [@w4ll3](https://github.com/w4ll3) for his support in making this plugin.

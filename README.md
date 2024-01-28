# CyberPeace Secure DNS VPN App

A VPN application

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Installation

1. Clone the repository

   ```bash
   git clone https://github.com/jagtap-suraj/cyberpeace_secure_dns.git
   ```

2. Go to the project directory

   ```bash
   cd cyberpeace_secure_dns
   ```

3. Install dependencies

   ```bash
   flutter pub get
   ```

4. Create a secret.dart file inside the lib folder and add your vpn configuration file data as follows:

   ```dart
   const String ovpnConfig = '''
   [Interface]
   PrivateKey = your_private_key
   Address = 10.8.0.4/32
   DNS = 1.1.1.1

   [peer]
   PublicKey = your_public_key
   AllowedIPs = 0.0.0.0/0, ::/0
   PersistentKeepalive = 0
   Endpoint = your_endpoint
   ''';
   ```

   to get your configuration file refer to [this](https://protonvpn.com/support/wireguard-manual-android/) article.

5. Run the app

   ```bash
    flutter run
   ```

## Screenshots

<img src="https://github.com/jagtap-suraj/cyberpeace_secure_dns/assets/89206671/ab8bf329-05e0-40ce-8b07-5d9211147cb2" width="200">

### Note:

There's a sligh bug in the code, to connect to the vpn for the first time after clicking on the initiaize button, you need to click on the connect button twice. I'll fix it soon!

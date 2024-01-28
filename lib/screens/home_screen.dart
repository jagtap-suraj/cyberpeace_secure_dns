import 'dart:async';

import 'package:cyberpeace_secure_dns/widgets/vpn_button.dart';
import 'package:flutter/material.dart';
import 'package:wireguard_flutter/wireguard_flutter.dart';
import 'package:cyberpeace_secure_dns/secret.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final wireguard = WireGuardFlutter.instance;

  late String name;

  @override
  void initState() {
    super.initState();
    wireguard.vpnStageSnapshot.listen((event) {
      debugPrint("status changed $event");
      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('status changed: $event'),
        ));
      }
    });
    name = 'wg_vpn';
  }

  Future<void> initialize() async {
    try {
      await wireguard.initialize(interfaceName: name);
      debugPrint("initialize success");
    } catch (error, stack) {
      debugPrint("failed to initialize: $error\n$stack");
    }
  }

  void startVpn() async {
    try {
      await wireguard.startVpn(
        serverAddress: 'http://115.113.39.74:65528/api/user/wireguardapi',
        wgQuickConfig: conf,
        providerBundleIdentifier: 'com.example.cyberpeace_secure_dns',
      );
    } catch (error, stack) {
      debugPrint("failed to start $error\n$stack");
    }
  }

  void disconnect() async {
    try {
      await wireguard.stopVpn();
    } catch (e, str) {
      debugPrint('Failed to disconnect $e\n$str');
    }
  }

  void getStatus() async {
    debugPrint("getting stage");
    final stage = await wireguard.stage();
    debugPrint("stage: $stage");

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('stage: $stage'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CyberPeace Secure DNS'),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              VPNButton(
                onPressed: () {
                  initialize();
                },
                label: 'Initialize',
              ),
              const SizedBox(height: 20),
              VPNButton(
                onPressed: () {
                  startVpn();
                },
                label: 'Connect',
              ),
              const SizedBox(height: 20),
              VPNButton(
                onPressed: () {
                  disconnect();
                },
                label: 'Disconnect',
              ),
              const SizedBox(height: 20),
              VPNButton(
                onPressed: () {
                  getStatus();
                },
                label: 'Get Status',
              ),
            ],
          ),
        ));
  }
}

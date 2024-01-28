import 'package:flutter/material.dart';

class VPNButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String  label;
  const VPNButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
                onPressed: onPressed,
                style: ButtonStyle(minimumSize: MaterialStateProperty.all<Size>(const Size(100, 50)), padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 15, 20, 15)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent), overlayColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.1))),
                child:  Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
              );
  }
}
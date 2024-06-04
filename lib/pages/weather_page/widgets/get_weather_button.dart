import 'package:flutter/material.dart';

class GetWeatherButton extends StatelessWidget {
  const GetWeatherButton({super.key, required this.onBtnTap});

  static const btnText = 'Get Weather';

  final VoidCallback onBtnTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          surfaceTintColor: WidgetStatePropertyAll(Colors.white),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          backgroundColor: WidgetStatePropertyAll(Colors.white)),
      onPressed: onBtnTap,
      child: const Text(
        btnText,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

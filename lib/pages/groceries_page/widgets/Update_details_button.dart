import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateButton extends ConsumerWidget {
  const UpdateButton({super.key, required this.onBtnTap});
  static const btnText = 'Update Details';
  final VoidCallback onBtnTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(onPressed: onBtnTap, child: const Text(btnText));
  }
}

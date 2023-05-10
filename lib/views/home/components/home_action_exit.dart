import 'package:flutter/material.dart';

class HomeActionExit extends StatelessWidget {
  /// 当点击退出的时候
  final VoidCallback onPressed;
  const HomeActionExit({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
      ),
      child: const Text('退出'),
    );
  }
}

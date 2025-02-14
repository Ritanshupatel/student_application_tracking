import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int progress;

  const ProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(value: progress / 5),
        Text('Stage: $progress/5'),
      ],
    );
  }
}

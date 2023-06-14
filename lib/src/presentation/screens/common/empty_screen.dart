import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text("Empty"),
          TextButton(
            onPressed: context.popRoute,
            child: const Text("뒤로가기"),
          ),
        ]),
      ),
    );
  }
}

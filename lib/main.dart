import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/app.dart';

void main() {
  runApp(const ProviderScope(
    child: App(),
  ));
}

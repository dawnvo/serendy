import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:serendy/src/configs/configs.dart';

class TitleTextField extends HookWidget {
  const TitleTextField({
    super.key,
    this.focusNode,
    this.value,
    this.placeholder,
    this.onChanged,
    this.autofocus = false,
  });

  final FocusNode? focusNode;
  final bool autofocus;
  final String? value;
  final String? placeholder;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: value);
    final baseStyle = context.textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w500,
    );
    return TextField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      onChanged: onChanged,
      maxLength: 30,
      style: baseStyle,
      textAlign: TextAlign.center,
      autofillHints: const ['test', 'chohoho'],
      decoration: InputDecoration(
        hintStyle: baseStyle?.copyWith(
          color: context.colorScheme.outline,
        ),
        hintText: placeholder,
        counterText: "",
      ),
    );
  }
}

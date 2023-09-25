import 'package:serendy/src/configs/configs.dart';

class TitleTextField extends HookWidget {
  const TitleTextField({
    this.focusNode,
    this.value,
    this.hintText,
    this.onChanged,
    this.autofocus = false,
  });

  final FocusNode? focusNode;
  final bool autofocus;
  final String? value;
  final String? hintText;
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
      decoration: InputDecoration(
        hintStyle: baseStyle?.copyWith(
          color: context.colorScheme.outline,
        ),
        hintText: hintText,
        counterText: "",
      ),
    );
  }
}

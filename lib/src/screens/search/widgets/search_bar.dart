part of '../search_screen.dart';

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.controller,
    this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final leading = IconButton(
      onPressed: () => context.popRoute(),
      icon: const Icon(RemixIcon.arrow_left_line),
    );

    final trailing = [
      IconButton(
        iconSize: Sizes.p20,
        color: context.colorScheme.outline,
        icon: const Icon(RemixIcon.close_circle_fill),
        onPressed: () => controller.clear(),
      ),
    ];

    return SearchBar(
      controller: controller,
      focusNode: focusNode,
      leading: leading,
      trailing: trailing,
      hintText: "무슨 애니를 찾으시나요?",
      constraints: const BoxConstraints(minHeight: _kSearchBarHeight),
      overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
      elevation: const MaterialStatePropertyAll<double>(0.0),
    );
  }
}

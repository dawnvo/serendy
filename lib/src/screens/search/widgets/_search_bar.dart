part of '../search_screen.dart';

class _SearchBar extends ConsumerWidget {
  const _SearchBar();

  final double _searchBarHeight = 72.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(queryControllerProvider);

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: _searchBarHeight),
      child: Row(children: [
        //back
        IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(RemixIcon.arrow_left_line),
        ),
        //input
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              hintText: "무슨 애니를 찾으시나요?",
              border: InputBorder.none,
            ),
            controller: controller,
            autofocus: true,
          ),
        ),
        //clear
        ValueListenableBuilder(
          valueListenable: controller,
          child: IconButton(
            onPressed: () => controller.clear(),
            icon: const Icon(RemixIcon.close_fill),
          ),
          builder: (context, value, child) {
            if (value.text.isNotEmpty) return child!;
            return const SizedBox();
          },
        ),
      ]),
    );
  }
}

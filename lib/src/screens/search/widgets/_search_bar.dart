part of '../search_screen.dart';

class _SearchBar extends ConsumerWidget {
  const _SearchBar();

  static const _height = Sizes.p72;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(searchQueryControllerProvider);

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: _height),
      child: Row(children: [
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
        //button
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

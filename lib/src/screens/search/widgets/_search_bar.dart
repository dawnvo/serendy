part of '../search_screen.dart';

class _SearchBar extends HookConsumerWidget {
  const _SearchBar();

  final double _searchBarHeight = 72.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncer = ref.watch(debouncerProvider);
    final controller = useTextEditingController();
    final focusNode = useFocusNode();

    // * 검색어를 입력하면 검색을 진행해요.
    useEffect(() {
      void searchMedias() => debouncer.run(() => ref
          .read(searchControllerProvider.notifier)
          .searchMedias(controller.text));

      controller.addListener(searchMedias);
      return () => controller.removeListener(searchMedias);
    }, [controller]);

    // * 빌드 시 SearchBar를 포커스해요.
    useEffect(() {
      focusNode.requestFocus();
      return null;
    }, []);

    final leading = IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(RemixIcon.arrow_left_line),
    );
    final trailing = [
      IconButton(
        onPressed: () => controller.clear(),
        icon: const Icon(RemixIcon.close_fill),
      ),
    ];
    return SearchBar(
      leading: leading,
      trailing: trailing,
      hintText: "무슨 애니를 찾으시나요?",
      constraints: BoxConstraints(minHeight: _searchBarHeight),
      overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
      elevation: const MaterialStatePropertyAll<double>(0.0),
      focusNode: focusNode,
      controller: controller,
    );
  }
}

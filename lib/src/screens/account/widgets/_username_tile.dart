part of '../account_screen.dart';

class _AccountUsernameTile extends ConsumerWidget {
  const _AccountUsernameTile({required this.username});
  final String username;

  void handleTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: context.mediaQuery.viewInsets.bottom,
        ),
        child: _AccountUsernameBottomSheet(username),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _AccountListTile(
      onTap: () => handleTap(context),
      title: "아이디",
      subtitle: '@$username',
    );
  }
}

class _AccountUsernameBottomSheet extends HookConsumerWidget {
  const _AccountUsernameBottomSheet(this.username);
  final String username;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: username);

    return BottomSheetTemplate(
      child: Padding(
        padding: const EdgeInsets.all(kContentPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(context, ref, controller),
            Gap.h24,
            _buildSubmitButton(context, ref, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    WidgetRef ref,
    TextEditingController controller,
  ) {
    final debouncer = ref.watch(debouncerProvider);
    final errorMessage = ref.watch(accountControllerProvider.select(
      (_) => _.value?.errorMessage,
    ));

    final onChange = useCallback((String value) {
      debouncer.run(() {
        ref //
            .read(accountControllerProvider.notifier)
            .validateUsername(value);
      });
    }, []);

    final baseStyle = context.textTheme.titleLarge;
    return TextField(
      controller: controller,
      onChanged: onChange,
      maxLength: Assets.usernameMaxLength,
      inputFormatters: [LowerCaseTextFormatter()],
      style: baseStyle,
      decoration: InputDecoration(
        hintStyle: baseStyle?.copyWith(
          color: context.colorScheme.outline,
        ),
        prefixText: "@",
        labelText: "아이디 변경",
        hintText: "아이디",
        counterText: "",
        errorText: errorMessage,
      ),
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    WidgetRef ref,
    TextEditingController controller,
  ) {
    final errorMessage = ref.watch(accountControllerProvider.select(
      (_) => _.value?.errorMessage,
    ));

    final onPressed = useCallback(() async {
      try {
        // * 아이디를 변경해요.
        await ref //
            .read(accountControllerProvider.notifier)
            .submit(username: controller.text);

        // * 위젯이 폐기된 경우 작업을 끝내요.
        if (!context.mounted) return;

        // * success
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("아이디를 변경했어요."),
        ));

        // * failure
      } catch (err) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(err.toString()),
        ));

        // * 메뉴를 닫아요.
      } finally {
        context.pop();
      }
    }, [controller]);

    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(Sizes.p40),
      ),
      onPressed: errorMessage == null ? onPressed : null,
      child: const Text("변경하기"),
    );
  }
}

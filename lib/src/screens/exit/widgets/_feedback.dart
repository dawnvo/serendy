part of '../exit_screen.dart';

class _ExitFeedback extends ConsumerWidget {
  const _ExitFeedback();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exitControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '떠나려는 이유가 궁금해요.',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap.h12,
        _buildDropdownButton(
          hintText: "선택해주세요.",
          value: state.reason,
          onChanged: (value) => ref //
              .read(exitControllerProvider.notifier)
              .changeReason(value),
        ),
        Gap.h8,
        if (state.reason != null)
          _buildTextArea(
            hintText: "(선택) 의견을 들려주실 수 있을까요?",
            onChanged: (value) => ref //
                .read(exitControllerProvider.notifier)
                .changeComment(value),
          ),
      ],
    );
  }

  Widget _buildDropdownButton({
    required String hintText,
    required ExitReason? value,
    required void Function(ExitReason?) onChanged,
  }) {
    final items = ExitReason.values.map((value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value.label),
      );
    });

    return InputDecorator(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          horizontal: kContentPadding,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          hint: Text(hintText),
          value: value,
          onChanged: onChanged,
          items: items.toList(),
        ),
      ),
    );
  }

  Widget _buildTextArea({
    required String hintText,
    required void Function(String)? onChanged,
  }) {
    return TextField(
      minLines: 3,
      maxLines: null,
      onChanged: onChanged,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(kContentPadding),
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}

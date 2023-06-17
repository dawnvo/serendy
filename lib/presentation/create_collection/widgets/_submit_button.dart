part of 'package:serendy/presentation/create_collection/create_collection_screen.dart';

class _CreateCollectionSubmitButton extends StatelessWidget {
  const _CreateCollectionSubmitButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        textStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () => context
          .read<CreateCollectionBloc>()
          .add(const CreateCollection$Submitted()),
      child: const Text("만들기"),
    );
  }
}

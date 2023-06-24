part of 'package:serendy/presentation/collection_edit/edit_collection_screen.dart';

class _EditCollectionImagePicker extends StatelessWidget {
  const _EditCollectionImagePicker();

  @override
  Widget build(BuildContext context) {
    final imagePath = context.select<EditCollectionBloc, String?>(
      (bloc) => bloc.state.image,
    );

    return ImagePicker(
      onChange: (image) => context
          .read<EditCollectionBloc>()
          .add(EditCollection$ImageChanged(image)),
      image: imagePath,
    );
  }
}

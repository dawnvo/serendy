part of 'package:serendy/presentation/account/account_screen.dart';

final _imageProvider = StateProvider.autoDispose<String?>((ref) => null);

class _AccountImagePicker extends ConsumerWidget {
  const _AccountImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(_imageProvider);

    return ImagePicker(
      onChange: (path) => ref.read(_imageProvider.notifier).state = path,
      image: image,
      circle: true,
    );
  }
}

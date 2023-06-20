part of 'package:serendy/presentation/account/account_screen.dart';

class _AccountImagePicker extends StatelessWidget {
  const _AccountImagePicker();

  @override
  Widget build(BuildContext context) {
    final imagePath = context.select<AccountBloc, String?>(
      (bloc) => bloc.state.avatar,
    );

    return ImagePicker(
      onChange: (path) {},
      image: imagePath,
      circle: true,
    );
  }
}

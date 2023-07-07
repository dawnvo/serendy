import 'package:serendy/src/configs/configs.dart';

class ProfileCardContainer extends StatelessWidget {
  const ProfileCardContainer({
    required this.color,
    required this.child,
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final hex = color.value.toRadixString(16).substring(2);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(children: [
        SvgPicture.string(
          _svg.replaceAll(_token, '#$hex'),
          alignment: const Alignment(0, -0.2),
          fit: BoxFit.cover,
        ),
        child,
      ]),
    );
  }
}

const _token = '[COLOR]';
const _svg =
    '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 800 1280">'
    '<path fill="$_token" d="M800 0H0v1280h800V0Z"/>'
    '<path fill="#fff" fill-opacity=".1" d="M228 1612a686 686 0 1 0 0-1372 686 686 0 0 0 0 1372Z"/>'
    '</svg>';

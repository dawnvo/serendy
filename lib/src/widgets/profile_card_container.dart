import 'package:serendy/src/configs/configs.dart';

class ProfileCardContainer extends StatelessWidget {
  const ProfileCardContainer({
    required this.color,
    required this.child,
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
    '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 2000 3200">'
    '<path fill="$_token" d="M2000 0H0v3200h2000V0Z"/>'
    '<path fill="#fff" fill-opacity=".08" d="M570 4030c225.217 0 448.23-44.36 656.3-130.55 208.08-86.18 397.14-212.51 556.39-371.76s285.58-348.31 371.76-556.39C2240.64 2763.23 2285 2540.22 2285 2315c0-225.22-44.36-448.23-130.55-656.3-86.18-208.08-212.51-397.14-371.76-556.39-159.25-159.251-348.31-285.577-556.39-371.763C1018.23 644.36 795.217 600 570 600c-454.846 0-891.063 180.687-1212.688 502.31C-964.313 1423.94-1145 1860.15-1145 2315s180.687 891.06 502.312 1212.69C-321.063 3849.31 115.154 4030 570 4030Z"/>'
    '</svg>';

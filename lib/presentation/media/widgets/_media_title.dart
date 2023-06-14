part of 'package:serendy/presentation/media/media_screen.dart';

class _MediaTitle extends StatelessWidget {
  const _MediaTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kContentPadding,
        vertical: Sizes.p8,
      ),
      child: Text(
        title,
        style: _titleStyle(context),
      ),
    );
  }

  TextStyle? _titleStyle(BuildContext context) {
    final TextStyle? style;

    // [Small] 16자 이상
    if (title.length > 16) {
      style = context.textTheme.headlineSmall;
    }
    // [Meduium] 12자 이상
    else if (title.length > 12) {
      style = context.textTheme.headlineMedium;
    }
    // [Large] 기본 크기
    else {
      style = context.textTheme.headlineLarge;
    }

    return style?.copyWith(fontWeight: FontWeight.w500);
  }
}

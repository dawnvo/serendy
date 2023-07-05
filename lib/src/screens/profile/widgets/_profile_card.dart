part of '../profile_screen.dart';

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    required this.user,
    required this.indicator,
  });

  final User user;
  final _ProfileWatchedMediaIndicator indicator;

  @override
  Widget build(BuildContext context) {
    return __ProfileCardContainer(contents: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap.h8,
          Text(
            user.name,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: context.textTheme.headlineLarge?.copyWith(
              color: const Color(0xCCFFFFFF),
            ),
          ),
          Text(
            "아이언 등급",
            style: context.textTheme.bodyMedium?.copyWith(
              color: const Color(0xCCFFFFFF),
            ),
          ),
        ],
      ),
      indicator,
    ]);
  }
}

class __ProfileCardContainer extends StatelessWidget {
  const __ProfileCardContainer({required this.contents});

  final List<Widget> contents;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: Container(
        width: double.infinity,
        height: 160,
        color: const Color(0xFF0F042F),
        child: Stack(children: [
          // * Circle
          const Positioned(
            left: -100,
            bottom: -220,
            child: CustomPaint(
              size: Size.fromRadius(240),
              painter: __CirclePainter(
                color: Color(0xFF201A3C),
              ),
            ),
          ),
          // * Content
          Padding(
            padding: const EdgeInsets.all(kContentPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contents,
            ),
          ),
        ]),
      ),
    );
  }
}

class __CirclePainter extends CustomPainter {
  const __CirclePainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paint = Paint()..color = color;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

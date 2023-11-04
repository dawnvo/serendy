part of '../sign_in_screen.dart';

class _SignInBackground extends StatelessWidget {
  const _SignInBackground();

  @override
  Widget build(BuildContext context) {
    final inductions = [
      Assets.inductionLeft,
      Assets.inductionCenter,
      Assets.inductionRight,
    ];
    const gap = 4.0;
    final count = inductions.length;
    final width = (context.screenWidth - (gap * (count - 1))) / count;

    return Transform.scale(
      scale: 1.2,
      child: SingleChildScrollView(
        child: Row(children: [
          // background
          for (var i = 0; i < inductions.length; i++)
            MirrorAnimationBuilder(
              tween: MovieTween() //
                ..tween(
                  'induction-$i',
                  i % 2 == 1 //
                      ? Tween(begin: 0.0, end: -width)
                      : Tween(begin: -width, end: 0.0),
                  duration: const Duration(seconds: 1),
                ),
              duration: const Duration(seconds: 30),
              child: Image.asset(
                inductions[i],
                width: width,
                fit: BoxFit.cover,
              ),
              builder: (context, value, child) {
                final x = gap * i;
                final y = value.get('induction-$i');
                return Transform.translate(
                  offset: Offset(x, y),
                  child: child,
                );
              },
            ),
        ]),
      ),
    );
  }
}

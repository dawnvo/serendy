import 'package:serendy/src/configs/configs.dart';

class ErrorTemplate extends StatelessWidget {
  const ErrorTemplate({
    required this.message,
    this.sliver = false,
    this.backButton = false,
  });

  final String message;
  final bool sliver;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    final body = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          Gap.h8,
          if (backButton)
            TextButton(
              onPressed: () => context.pop(),
              child: const Text("이전으로"),
            ),
        ],
      ),
    );

    if (sliver) {
      return SliverToBoxAdapter(child: body);
    } else {
      return Scaffold(body: body);
    }
  }
}

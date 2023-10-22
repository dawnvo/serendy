import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

import 'controller/exit_controller.dart';

part 'widgets/_caution.dart';
part 'widgets/_feedback.dart';
part 'widgets/_submit_button.dart';

class ExitScreen extends ConsumerWidget {
  static const String routeName = 'exit';
  static const String routeLocation = routeName;
  const ExitScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(exitControllerProvider, (previous, next) {
      //failure
      if (next.status == ExitStatus.failure) {
        final errorMessage = next.errorMessage ?? '서버에 문제가 발생했어요.';
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    });

    return const _ExitTemplate(
      caution: _ExitCaution(),
      feedback: _ExitFeedback(),
      submitButton: _ExitSubmitButton(),
    );
  }
}

//template
class _ExitTemplate extends StatelessWidget {
  const _ExitTemplate({
    required this.caution,
    required this.feedback,
    required this.submitButton,
  });

  final _ExitCaution caution;
  final _ExitFeedback feedback;
  final _ExitSubmitButton submitButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text("탈퇴하기")),
        body: const Padding(
          padding: EdgeInsets.all(kContentPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ExitCaution(),
              Gap.h24,
              _ExitFeedback(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(kContentPadding),
          child: submitButton,
        ),
      ),
    );
  }
}

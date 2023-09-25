import 'package:flutter/cupertino.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    required this.title,
    required this.actions,
    this.content,
  });

  final String title;
  final Widget? content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      height: 1.5,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    );

    return CupertinoAlertDialog(
      title: Text(title, style: titleStyle),
      content: content,
      actions: actions,
    );
  }
}

class CustomDialogAction extends CupertinoDialogAction {
  const CustomDialogAction({
    required super.child,
    super.onPressed,
    super.isDefaultAction,
    super.isDestructiveAction,
    super.textStyle,
  });
}

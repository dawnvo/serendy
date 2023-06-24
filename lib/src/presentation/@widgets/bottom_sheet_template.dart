import 'package:flutter/material.dart';
import 'package:serendy/src/configs/configs.dart';

class BottomSheetTemplate extends StatelessWidget {
  const BottomSheetTemplate({
    required this.child,
    super.key,
  });

  final Widget child;

  static const _interactiveDimension = 24.0;
  static const _handleSize = Size(40, 4);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _buildDragHandle(context),
        Padding(
          padding: const EdgeInsets.only(top: _interactiveDimension),
          child: child,
        ),
      ],
    );
  }

  Widget _buildDragHandle(BuildContext context) {
    return SizedBox(
      height: _interactiveDimension,
      child: Center(
        child: Container(
          width: _handleSize.width,
          height: _handleSize.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_handleSize.height / 2),
            color: context.colorScheme.outline,
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:image_picker/image_picker.dart' as picker;
import 'package:serendy/src/configs/configs.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({
    required this.onChange,
    this.image,
    this.size = 200,
    this.circle = false,
  });

  final String? image;
  final double size;
  final bool circle;
  final void Function(String? path) onChange;

  Future<void> _handlePicker() async {
    final picked = await picker.ImagePicker().pickImage(
      source: picker.ImageSource.gallery,
      // ✨ 이미지 최적화
      maxWidth: 640,
      maxHeight: 480,
      imageQuality: 60,
    );

    onChange(picked?.path);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handlePicker,
      child: Column(children: [
        _buildImage(context),
        _buildLabel(context),
      ]),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circle ? null : BorderRadius.circular(kBorderRadius),
        color: context.colorScheme.surfaceVariant,
      ),
      clipBehavior: Clip.hardEdge,
      width: size,
      height: size,
      child: _PickedImage(image),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      '이미지 변경',
      style: context.textTheme.labelMedium?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
        height: 3,
      ),
    );
  }
}

/// Picked image
class _PickedImage extends StatelessWidget {
  const _PickedImage(this.fileOrUrl);

  final String? fileOrUrl;

  @override
  Widget build(BuildContext context) {
    // Is File: 로컬에서 이미지를 선택한 경우
    if (fileOrUrl != null &&
        fileOrUrl!.isNotEmpty &&
        File(fileOrUrl!).existsSync()) {
      return Image.file(
        File(fileOrUrl!),
        fit: BoxFit.cover,
      );
    }

    // Is URL: 서버에서 이미지를 불러온 경우
    else if (fileOrUrl != null &&
        fileOrUrl!.isNotEmpty &&
        Uri.parse(fileOrUrl!).isAbsolute) {
      return Image.network(
        fileOrUrl!,
        fit: BoxFit.cover,
      );
    }

    return Icon(
      RemixIcon.add_fill,
      size: Sizes.p40,
      color: context.colorScheme.onSurfaceVariant,
    );
  }
}

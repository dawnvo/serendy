import 'package:flutter/material.dart';
import 'package:serendy/src/configs/configs.dart';

class MenuTemplate extends StatelessWidget {
  const MenuTemplate({
    required this.info,
    required this.options,
    super.key,
  });

  final MenuInfo info;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Gap.h4,
        info,
        Gap.h16,
        const Divider(),
        Column(children: options),
      ]),
    );
  }
}

class MenuInfo extends StatelessWidget {
  const MenuInfo({
    required this.image,
    required this.title,
    super.key,
  });

  final String image;
  final String title;

  final double _kImageSize = 48.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.p8),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width: _kImageSize,
            height: _kImageSize,
          ),
        ),
        Gap.w12,
        Text(title),
      ]),
    );
  }
}

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  final Widget icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      horizontalTitleGap: Sizes.p24,
      onTap: onTap,
      leading: icon,
      title: Text(title),
      iconColor: context.colorScheme.outline,
      titleTextStyle: context.textTheme.bodyMedium,
    );
  }
}

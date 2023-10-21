import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/widgets/widgets.dart';

//template
class MenuTemplate extends StatelessWidget {
  const MenuTemplate({
    required this.info,
    required this.options,
  });

  final MenuInfo info;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        info,
        Divider(color: context.colorScheme.outlineVariant),
        Column(children: options),
      ]),
    );
  }
}

//info
class MenuInfo extends StatelessWidget {
  const MenuInfo({
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
      child: ListItem(
        image: image,
        title: title,
      ),
    );
  }
}

//list-tile
class MenuListTile extends StatelessWidget {
  const MenuListTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final Widget icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(title),
      horizontalTitleGap: Sizes.p24,
      iconColor: context.colorScheme.outline,
      titleTextStyle: context.textTheme.bodyMedium,
    );
  }
}

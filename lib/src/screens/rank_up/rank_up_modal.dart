import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/enums.dart';

class RankUpModal extends ConsumerWidget {
  static const String routeName = 'rankUp';
  static const String routeLocation = '/$routeName';
  const RankUpModal({required this.rank});

  final Rank rank;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(context),
            Gap.h24,
            _buildTitles(context),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(kContentPadding),
        child: _buildButton(context),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return SvgPicture.asset(
      rank.filePath,
      fit: BoxFit.cover,
      height: 240,
    );
  }

  Widget _buildTitles(BuildContext context) {
    return Column(children: [
      Text(
        rank.label,
        style: context.textTheme.displayMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      Gap.h12,
      Text(
        "작품 ${rank.range.min}개를 감상했어요.",
        style: context.textTheme.titleMedium,
      ),
    ]);
  }

  Widget _buildButton(BuildContext context) {
    return FilledButton(
      onPressed: () => context.pop(),
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        textStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      child: const Text("계속하기"),
    );
  }
}

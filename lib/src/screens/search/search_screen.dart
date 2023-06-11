import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/_mock.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/widgets/media_item.dart';

part 'widgets/search_bar.dart';
part 'widgets/search_filter_chip_bar.dart';
part 'widgets/search_results.dart';

const _kSearchBarHeight = 72.0;

@RoutePage()
class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();

    // 빌드 시 SearchBar를 자동으로 포커스해요.
    useEffect(() {
      focusNode.requestFocus();
      return null;
    }, []);

    return _SearchTemplate(
      searchBar: _SearchBar(
        controller: controller,
        focusNode: focusNode,
      ),
      searchFilterChipBar: const _SearchFilterChipBar(),
      searchResults: const _SearchResults(),
    );
  }
}

class _SearchTemplate extends StatelessWidget {
  const _SearchTemplate({
    required this.searchBar,
    required this.searchFilterChipBar,
    required this.searchResults,
  });

  final _SearchBar searchBar;
  final _SearchFilterChipBar searchFilterChipBar;
  final _SearchResults searchResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(_kSearchBarHeight),
        child: searchBar,
      ),
      body: Column(children: [
        const Divider(height: 1),
        SizedBox(
          width: double.infinity,
          height: kToolbarHeight,
          child: searchFilterChipBar,
        ),
        Expanded(child: searchResults),
      ]),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/_mock.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/presentation/@sheets/sheets.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

part 'widgets/_search_bar.dart';
part 'widgets/_search_filter_chip_bar.dart';
part 'widgets/_search_results.dart';

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
    return SafeArea(
      child: Material(
        child: GestureDetector(
          /// TODO 뒤로가기(사이드를 당기는) 동작이랑 이벤트가 겹쳐 키보드가 닫히는 동시에 뒤로가지는 문제.
          onPanDown: (details) => FocusScope.of(context).unfocus(),
          child: Column(children: [
            searchBar,
            const Divider(),
            SizedBox(
              width: double.infinity,
              height: kToolbarHeight,
              child: searchFilterChipBar,
            ),
            Expanded(child: searchResults),
          ]),
        ),
      ),
    );
  }
}

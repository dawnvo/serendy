import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/search_controller.dart';

part 'widgets/_search_bar.dart';
part 'widgets/_search_results.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = 'search';
  static const String routeLocation = '/$routeName';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SearchTemplate(
      searchBar: _SearchBar(),
      searchResults: _SearchResults(),
    );
  }
}

class _SearchTemplate extends StatelessWidget {
  const _SearchTemplate({
    required this.searchBar,
    required this.searchResults,
  });

  final _SearchBar searchBar;
  final _SearchResults searchResults;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          /// TODO 뒤로가기(사이드를 당기는) 동작이랑 이벤트가 겹쳐 키보드가 닫히는 동시에 뒤로가지는 문제.
          onPanDown: (details) => FocusScope.of(context).unfocus(),
          child: Column(children: [
            searchBar,
            const Divider(),
            Expanded(child: searchResults),
          ]),
        ),
      ),
    );
  }
}
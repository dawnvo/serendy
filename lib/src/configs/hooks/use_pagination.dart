import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ScrollController usePagination(
  VoidCallback fetchData, [
  bool Function()? canLoadMore,
]) {
  final scrollController = useScrollController();

  void scrollListener() {
    // * 조건부 실행
    if (canLoadMore?.call() == false) return;
    // * 최대 스크롤 범위에 달하면 [fetchData]를 실행해요.
    if (scrollController.position.pixels >= //
        scrollController.position.maxScrollExtent) {
      fetchData();
    }
  }

  useEffect(() {
    scrollController.addListener(scrollListener);
    return () => scrollController.removeListener(scrollListener);
  }, [scrollController]);

  return scrollController;
}

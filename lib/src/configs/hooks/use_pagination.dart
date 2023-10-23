import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ScrollController usePagination(
  VoidCallback fetchData,
  bool Function() canLoadMore,
) {
  final scrollController = useScrollController();

  void scrollListener() {
    // * 최대 스크롤 범위에 달하면 [fetchData]를 실행해요.
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    if (maxScroll <= currentScroll && canLoadMore()) {
      fetchData();
    }
  }

  useEffect(() {
    scrollController.addListener(scrollListener);
    return () => scrollController.removeListener(scrollListener);
  }, [scrollController]);

  return scrollController;
}

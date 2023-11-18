part of '../search_screen.dart';

class _SearchResults extends ConsumerWidget {
  const _SearchResults();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryControllerProvider.select((_) => _.text));
    final searchValue = ref.watch(searchControllerProvider);

    // * 검색어 없는 경우
    if (searchQuery.isEmpty) {
      return const SliverToBoxAdapter();
    }

    // * 검색 중 에러 발생한 경우
    final error = searchValue.error;
    if (error != null) {
      return const ErrorTemplate(
        message: "검색 결과를 불러오지 못했어요.",
        sliver: true,
      );
    }

    // * 검색 결과를 불러오는 경우
    final state = searchValue.value;
    if (state == null) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: 4,
          addAutomaticKeepAlives: false,
          (context, index) => const Placeholder$MediaItem(),
        ),
      );
    }

    // * 검색 결과가 없는 경우
    final medias = state.medias;
    if (medias.isEmpty) {
      return __NoSearchResults(query: searchQuery);
    }

    // * 검색 결과
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: medias.length,
        (context, index) {
          final media = medias[index]!;
          return _buildMediaItem(context, media);
        },
      ),
    );
  }

  Widget _buildMediaItem(BuildContext context, Media media) {
    return MediaItem(
      onTap: () => context.pushNamed(
        AppRoutes.media,
        pathParameters: {'id': media.id},
        extra: media,
      ),
      onMoreTap: () => MediaMenuSheet.show(context, media),
      media: media,
    );
  }
}

class __NoSearchResults extends ConsumerWidget {
  const __NoSearchResults({required this.query});
  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * URL을 불러와요.
    final remoteConfig = ref.watch(firebaseRemoteConfigProvider);
    final baseUrl = remoteConfig.getString('database_request');

    // * 이메일을 불러와요.
    final email = ref.watch(getMeProvider.select((_) => _.value?.email));

    // * 데이터베이스 요청 URL
    final queryParam = '?email=$email&title=$query';
    final databaseRequestUrl = "$baseUrl$queryParam";

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: Sizes.p40),
        child: Column(children: [
          Text(
            '"$query" 작품을 찾을 수 없어요.',
            style: context.textTheme.titleMedium,
          ),
          Gap.h4,
          Text(
            '작품을 요청하면 신속히 추가할게요.',
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.outline,
            ),
          ),
          Gap.h12,
          FilledButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => WebView(url: databaseRequestUrl),
            )),
            child: const Text('작품 요청하기'),
          ),
        ]),
      ),
    );
  }
}

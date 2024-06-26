import 'dart:developer';

import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/infrastructure/media_repository_fake.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/infrastructure/user_repository_fake.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/features/theme/theme.dart';

final class ThemeRepositoryFake implements ThemeRepository {
  ThemeRepositoryFake();

  final _themeStore = InMemoryStore(mockThemes);
  final _themeItemStore = InMemoryStore(mockThemeItems);

  @override
  Future<List<Theme?>> fetchThemes({
    UserID? userId,
    int? page,
    int? perPage,
  }) async {
    log(name: 'Repository', 'fetchThemes');
    var themes = _themeStore.value;
    if (userId != null) themes = themes.where((_) => _.owner.id == userId).toList();
    if (userId == null) themes = themes.where((_) => _.private == false).toList();
    return themes..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  @override
  Future<Theme?> fetchThemeSlice({
    required ThemeID id,
  }) async {
    log(name: 'Repository', 'fetchThemeSlice');
    final themes = _themeStore.value;
    return themes //
        .where((_) => _.id == id)
        .where((_) => _.removedAt == null)
        .firstOrNull;
  }

  @override
  Future<Theme?> fetchTheme({
    required ThemeID id,
  }) async {
    log(name: 'Repository', 'fetchTheme');
    final themes = _themeStore.value;
    return themes //
        .where((_) => _.id == id)
        .where((_) => _.removedAt == null)
        .firstOrNull;
  }

  @override
  Future<void> createTheme(
    Theme theme,
  ) async {
    log(name: 'Repository', 'createTheme');
    final themes = _themeStore.value;
    themes.add(theme);
  }

  @override
  Future<void> updateTheme(
    Theme theme,
  ) async {
    log(name: 'Repository', 'updateTheme');
    final themes = _themeStore.value;
    final index = themes.indexWhere((_) => _.id == theme.id);
    if (index != -1) themes[index] = theme;
  }

  @override
  Future<void> removeTheme(
    Theme theme,
  ) async {
    log(name: 'Repository', 'removeTheme');
    final themes = _themeStore.value;
    themes.removeWhere((_) => _.id == theme.id);
  }

  @override
  Future<List<ThemeItem?>> fetchItems({
    required ThemeID id,
  }) async {
    log(name: 'Repository', 'fetchItems');
    final themeItems = _themeItemStore.value;
    return themeItems;
  }

  @override
  Future<void> addItem({
    required ThemeID themeId,
    required MediaID mediaId,
  }) async {
    log(name: 'Repository', 'addItem');
    final themeItems = _themeItemStore.value;
    themeItems.add(ThemeItem(
      mediaId: mediaId,
      title: mockMedias[0].title,
      image: mockMedias[0].image,
      addedAt: DateTime.now(),
    ));
  }

  @override
  Future<void> deleteItem({
    required ThemeID themeId,
    required MediaID mediaId,
  }) async {
    log(name: 'Repository', 'deleteItem');
    final themeItems = _themeItemStore.value;
    themeItems.removeWhere((_) => _.mediaId == mediaId);
  }

  @override
  Future<String?> uploadThemeImage(Theme theme) async {
    log(name: 'Repository', 'uploadThemeImage');
    return Assets.themeDefaultImage;
  }

  @override
  Future<void> deleteThemeImage(Theme theme) async {
    log(name: 'Repository', 'deleteThemeImage');
  }
}

final mockThemes = [
  Theme(
    owner: _mockThemeOwner,
    title: "M3",
    image: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx20789-SsAI4pvvI9EU.jpg",
    description: "특히 과학연구의 분야에서 실험 도중에 실패해서 얻은 결과에서 중대한 발견 또는 발명을 하는 것을 말한다",
  ),
  Theme(
    owner: _mockThemeOwner,
    title: "자바스크립트",
    image: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx21127-7ARWZkDXKiiD.jpg",
  ),
  Theme(
    owner: _mockThemeOwner,
    title: "ES2023에서 도입된 자바스크립트의 새로운 배열 복사 메서드",
    image: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx20876-CCVVLTSsnKC8.jpg",
  ),
  Theme(
    owner: _mockThemeOwner,
    title: "소 잃고 뇌약간 고친 MSA 구현기",
    image: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx98478-dF3mpSKiZkQu.jpg",
  ),
];

final _mockThemeOwner = ThemeOwner(
  id: mockUsers[0].id,
  username: mockUsers[0].username,
);

final mockThemeItems = mockMedias.map((media) {
  return ThemeItem(
    addedAt: DateTime.now(),
    mediaId: media.id,
    title: media.title,
    image: media.image,
  );
}).toList();

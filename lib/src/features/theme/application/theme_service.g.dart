// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchMyThemesListHash() => r'0d26952813a3447ec8ff9583e9606a576c56540d';

/// 나의 테마를 구독해요.
///
/// Copied from [watchMyThemesList].
@ProviderFor(watchMyThemesList)
final watchMyThemesListProvider = StreamProvider<List<Theme?>>.internal(
  watchMyThemesList,
  name: r'watchMyThemesListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchMyThemesListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchMyThemesListRef = StreamProviderRef<List<Theme?>>;
String _$fetchThemesListHash() => r'6cf73391ec4addb9c53c8d082804ab2693f4a002';

/// 여러 테마를 불러와요.
///
/// Copied from [fetchThemesList].
@ProviderFor(fetchThemesList)
final fetchThemesListProvider =
    AutoDisposeFutureProvider<List<Theme?>>.internal(
  fetchThemesList,
  name: r'fetchThemesListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchThemesListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchThemesListRef = AutoDisposeFutureProviderRef<List<Theme?>>;
String _$fetchThemeHash() => r'247780f6f216e6d711667f3b8bfe0dfafca5eef6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 테마를 불러와요.
///
/// Copied from [fetchTheme].
@ProviderFor(fetchTheme)
const fetchThemeProvider = FetchThemeFamily();

/// 테마를 불러와요.
///
/// Copied from [fetchTheme].
class FetchThemeFamily extends Family<AsyncValue<Theme>> {
  /// 테마를 불러와요.
  ///
  /// Copied from [fetchTheme].
  const FetchThemeFamily();

  /// 테마를 불러와요.
  ///
  /// Copied from [fetchTheme].
  FetchThemeProvider call({
    required String id,
  }) {
    return FetchThemeProvider(
      id: id,
    );
  }

  @override
  FetchThemeProvider getProviderOverride(
    covariant FetchThemeProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchThemeProvider';
}

/// 테마를 불러와요.
///
/// Copied from [fetchTheme].
class FetchThemeProvider extends AutoDisposeFutureProvider<Theme> {
  /// 테마를 불러와요.
  ///
  /// Copied from [fetchTheme].
  FetchThemeProvider({
    required String id,
  }) : this._internal(
          (ref) => fetchTheme(
            ref as FetchThemeRef,
            id: id,
          ),
          from: fetchThemeProvider,
          name: r'fetchThemeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchThemeHash,
          dependencies: FetchThemeFamily._dependencies,
          allTransitiveDependencies:
              FetchThemeFamily._allTransitiveDependencies,
          id: id,
        );

  FetchThemeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Theme> Function(FetchThemeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchThemeProvider._internal(
        (ref) => create(ref as FetchThemeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Theme> createElement() {
    return _FetchThemeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchThemeProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchThemeRef on AutoDisposeFutureProviderRef<Theme> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FetchThemeProviderElement extends AutoDisposeFutureProviderElement<Theme>
    with FetchThemeRef {
  _FetchThemeProviderElement(super.provider);

  @override
  String get id => (origin as FetchThemeProvider).id;
}

String _$fetchThemeItemsHash() => r'e9a10383a9d330eb7f57aa595d4477f7c1e1ffa0';

/// 테마 항목을 불러와요.
///
/// Copied from [fetchThemeItems].
@ProviderFor(fetchThemeItems)
const fetchThemeItemsProvider = FetchThemeItemsFamily();

/// 테마 항목을 불러와요.
///
/// Copied from [fetchThemeItems].
class FetchThemeItemsFamily extends Family<AsyncValue<List<ThemeItem?>>> {
  /// 테마 항목을 불러와요.
  ///
  /// Copied from [fetchThemeItems].
  const FetchThemeItemsFamily();

  /// 테마 항목을 불러와요.
  ///
  /// Copied from [fetchThemeItems].
  FetchThemeItemsProvider call({
    required String id,
  }) {
    return FetchThemeItemsProvider(
      id: id,
    );
  }

  @override
  FetchThemeItemsProvider getProviderOverride(
    covariant FetchThemeItemsProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchThemeItemsProvider';
}

/// 테마 항목을 불러와요.
///
/// Copied from [fetchThemeItems].
class FetchThemeItemsProvider
    extends AutoDisposeFutureProvider<List<ThemeItem?>> {
  /// 테마 항목을 불러와요.
  ///
  /// Copied from [fetchThemeItems].
  FetchThemeItemsProvider({
    required String id,
  }) : this._internal(
          (ref) => fetchThemeItems(
            ref as FetchThemeItemsRef,
            id: id,
          ),
          from: fetchThemeItemsProvider,
          name: r'fetchThemeItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchThemeItemsHash,
          dependencies: FetchThemeItemsFamily._dependencies,
          allTransitiveDependencies:
              FetchThemeItemsFamily._allTransitiveDependencies,
          id: id,
        );

  FetchThemeItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<List<ThemeItem?>> Function(FetchThemeItemsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchThemeItemsProvider._internal(
        (ref) => create(ref as FetchThemeItemsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ThemeItem?>> createElement() {
    return _FetchThemeItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchThemeItemsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchThemeItemsRef on AutoDisposeFutureProviderRef<List<ThemeItem?>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FetchThemeItemsProviderElement
    extends AutoDisposeFutureProviderElement<List<ThemeItem?>>
    with FetchThemeItemsRef {
  _FetchThemeItemsProviderElement(super.provider);

  @override
  String get id => (origin as FetchThemeItemsProvider).id;
}

String _$createThemeHash() => r'feaafa94f0263173da92603fea0b93690b48fb0b';

/// 테마를 만들어요.
///
/// Copied from [createTheme].
@ProviderFor(createTheme)
const createThemeProvider = CreateThemeFamily();

/// 테마를 만들어요.
///
/// Copied from [createTheme].
class CreateThemeFamily extends Family<AsyncValue<Theme>> {
  /// 테마를 만들어요.
  ///
  /// Copied from [createTheme].
  const CreateThemeFamily();

  /// 테마를 만들어요.
  ///
  /// Copied from [createTheme].
  CreateThemeProvider call({
    required String title,
  }) {
    return CreateThemeProvider(
      title: title,
    );
  }

  @override
  CreateThemeProvider getProviderOverride(
    covariant CreateThemeProvider provider,
  ) {
    return call(
      title: provider.title,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createThemeProvider';
}

/// 테마를 만들어요.
///
/// Copied from [createTheme].
class CreateThemeProvider extends AutoDisposeFutureProvider<Theme> {
  /// 테마를 만들어요.
  ///
  /// Copied from [createTheme].
  CreateThemeProvider({
    required String title,
  }) : this._internal(
          (ref) => createTheme(
            ref as CreateThemeRef,
            title: title,
          ),
          from: createThemeProvider,
          name: r'createThemeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createThemeHash,
          dependencies: CreateThemeFamily._dependencies,
          allTransitiveDependencies:
              CreateThemeFamily._allTransitiveDependencies,
          title: title,
        );

  CreateThemeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
  }) : super.internal();

  final String title;

  @override
  Override overrideWith(
    FutureOr<Theme> Function(CreateThemeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateThemeProvider._internal(
        (ref) => create(ref as CreateThemeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Theme> createElement() {
    return _CreateThemeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateThemeProvider && other.title == title;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateThemeRef on AutoDisposeFutureProviderRef<Theme> {
  /// The parameter `title` of this provider.
  String get title;
}

class _CreateThemeProviderElement
    extends AutoDisposeFutureProviderElement<Theme> with CreateThemeRef {
  _CreateThemeProviderElement(super.provider);

  @override
  String get title => (origin as CreateThemeProvider).title;
}

String _$editThemeHash() => r'c87e7384c8bd9662d54b25587971de18dce9b3a3';

/// 테마를 수정해요.
///
/// Copied from [editTheme].
@ProviderFor(editTheme)
const editThemeProvider = EditThemeFamily();

/// 테마를 수정해요.
///
/// Copied from [editTheme].
class EditThemeFamily extends Family<AsyncValue<Theme>> {
  /// 테마를 수정해요.
  ///
  /// Copied from [editTheme].
  const EditThemeFamily();

  /// 테마를 수정해요.
  ///
  /// Copied from [editTheme].
  EditThemeProvider call({
    required String id,
    required String title,
    String? description,
    String? image,
    bool? private,
  }) {
    return EditThemeProvider(
      id: id,
      title: title,
      description: description,
      image: image,
      private: private,
    );
  }

  @override
  EditThemeProvider getProviderOverride(
    covariant EditThemeProvider provider,
  ) {
    return call(
      id: provider.id,
      title: provider.title,
      description: provider.description,
      image: provider.image,
      private: provider.private,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'editThemeProvider';
}

/// 테마를 수정해요.
///
/// Copied from [editTheme].
class EditThemeProvider extends AutoDisposeFutureProvider<Theme> {
  /// 테마를 수정해요.
  ///
  /// Copied from [editTheme].
  EditThemeProvider({
    required String id,
    required String title,
    String? description,
    String? image,
    bool? private,
  }) : this._internal(
          (ref) => editTheme(
            ref as EditThemeRef,
            id: id,
            title: title,
            description: description,
            image: image,
            private: private,
          ),
          from: editThemeProvider,
          name: r'editThemeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editThemeHash,
          dependencies: EditThemeFamily._dependencies,
          allTransitiveDependencies: EditThemeFamily._allTransitiveDependencies,
          id: id,
          title: title,
          description: description,
          image: image,
          private: private,
        );

  EditThemeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.private,
  }) : super.internal();

  final String id;
  final String title;
  final String? description;
  final String? image;
  final bool? private;

  @override
  Override overrideWith(
    FutureOr<Theme> Function(EditThemeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EditThemeProvider._internal(
        (ref) => create(ref as EditThemeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        title: title,
        description: description,
        image: image,
        private: private,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Theme> createElement() {
    return _EditThemeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditThemeProvider &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image == image &&
        other.private == private;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, private.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditThemeRef on AutoDisposeFutureProviderRef<Theme> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `description` of this provider.
  String? get description;

  /// The parameter `image` of this provider.
  String? get image;

  /// The parameter `private` of this provider.
  bool? get private;
}

class _EditThemeProviderElement extends AutoDisposeFutureProviderElement<Theme>
    with EditThemeRef {
  _EditThemeProviderElement(super.provider);

  @override
  String get id => (origin as EditThemeProvider).id;
  @override
  String get title => (origin as EditThemeProvider).title;
  @override
  String? get description => (origin as EditThemeProvider).description;
  @override
  String? get image => (origin as EditThemeProvider).image;
  @override
  bool? get private => (origin as EditThemeProvider).private;
}

String _$removeThemeHash() => r'5e3ec084d59bd6371fd523acf99f9cb16eaff4c8';

/// 테마를 제거해요.
///
/// Copied from [removeTheme].
@ProviderFor(removeTheme)
const removeThemeProvider = RemoveThemeFamily();

/// 테마를 제거해요.
///
/// Copied from [removeTheme].
class RemoveThemeFamily extends Family<AsyncValue<void>> {
  /// 테마를 제거해요.
  ///
  /// Copied from [removeTheme].
  const RemoveThemeFamily();

  /// 테마를 제거해요.
  ///
  /// Copied from [removeTheme].
  RemoveThemeProvider call({
    required String id,
  }) {
    return RemoveThemeProvider(
      id: id,
    );
  }

  @override
  RemoveThemeProvider getProviderOverride(
    covariant RemoveThemeProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'removeThemeProvider';
}

/// 테마를 제거해요.
///
/// Copied from [removeTheme].
class RemoveThemeProvider extends AutoDisposeFutureProvider<void> {
  /// 테마를 제거해요.
  ///
  /// Copied from [removeTheme].
  RemoveThemeProvider({
    required String id,
  }) : this._internal(
          (ref) => removeTheme(
            ref as RemoveThemeRef,
            id: id,
          ),
          from: removeThemeProvider,
          name: r'removeThemeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeThemeHash,
          dependencies: RemoveThemeFamily._dependencies,
          allTransitiveDependencies:
              RemoveThemeFamily._allTransitiveDependencies,
          id: id,
        );

  RemoveThemeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<void> Function(RemoveThemeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveThemeProvider._internal(
        (ref) => create(ref as RemoveThemeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RemoveThemeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveThemeProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoveThemeRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;
}

class _RemoveThemeProviderElement extends AutoDisposeFutureProviderElement<void>
    with RemoveThemeRef {
  _RemoveThemeProviderElement(super.provider);

  @override
  String get id => (origin as RemoveThemeProvider).id;
}

String _$addThemeItemHash() => r'e8d989a18617b37a60ab76cae66892063b694b10';

/// 테마에 항목을 추가해요.
///
/// Copied from [addThemeItem].
@ProviderFor(addThemeItem)
const addThemeItemProvider = AddThemeItemFamily();

/// 테마에 항목을 추가해요.
///
/// Copied from [addThemeItem].
class AddThemeItemFamily extends Family<AsyncValue<Theme>> {
  /// 테마에 항목을 추가해요.
  ///
  /// Copied from [addThemeItem].
  const AddThemeItemFamily();

  /// 테마에 항목을 추가해요.
  ///
  /// Copied from [addThemeItem].
  AddThemeItemProvider call({
    required String id,
    required String mediaId,
  }) {
    return AddThemeItemProvider(
      id: id,
      mediaId: mediaId,
    );
  }

  @override
  AddThemeItemProvider getProviderOverride(
    covariant AddThemeItemProvider provider,
  ) {
    return call(
      id: provider.id,
      mediaId: provider.mediaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addThemeItemProvider';
}

/// 테마에 항목을 추가해요.
///
/// Copied from [addThemeItem].
class AddThemeItemProvider extends AutoDisposeFutureProvider<Theme> {
  /// 테마에 항목을 추가해요.
  ///
  /// Copied from [addThemeItem].
  AddThemeItemProvider({
    required String id,
    required String mediaId,
  }) : this._internal(
          (ref) => addThemeItem(
            ref as AddThemeItemRef,
            id: id,
            mediaId: mediaId,
          ),
          from: addThemeItemProvider,
          name: r'addThemeItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addThemeItemHash,
          dependencies: AddThemeItemFamily._dependencies,
          allTransitiveDependencies:
              AddThemeItemFamily._allTransitiveDependencies,
          id: id,
          mediaId: mediaId,
        );

  AddThemeItemProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.mediaId,
  }) : super.internal();

  final String id;
  final String mediaId;

  @override
  Override overrideWith(
    FutureOr<Theme> Function(AddThemeItemRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddThemeItemProvider._internal(
        (ref) => create(ref as AddThemeItemRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        mediaId: mediaId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Theme> createElement() {
    return _AddThemeItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddThemeItemProvider &&
        other.id == id &&
        other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddThemeItemRef on AutoDisposeFutureProviderRef<Theme> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `mediaId` of this provider.
  String get mediaId;
}

class _AddThemeItemProviderElement
    extends AutoDisposeFutureProviderElement<Theme> with AddThemeItemRef {
  _AddThemeItemProviderElement(super.provider);

  @override
  String get id => (origin as AddThemeItemProvider).id;
  @override
  String get mediaId => (origin as AddThemeItemProvider).mediaId;
}

String _$deleteThemeItemHash() => r'a10fc13579ecbb79aa60053620ec912b13015d60';

/// 테마 항목을 제거해요.
///
/// Copied from [deleteThemeItem].
@ProviderFor(deleteThemeItem)
const deleteThemeItemProvider = DeleteThemeItemFamily();

/// 테마 항목을 제거해요.
///
/// Copied from [deleteThemeItem].
class DeleteThemeItemFamily extends Family<AsyncValue<Theme>> {
  /// 테마 항목을 제거해요.
  ///
  /// Copied from [deleteThemeItem].
  const DeleteThemeItemFamily();

  /// 테마 항목을 제거해요.
  ///
  /// Copied from [deleteThemeItem].
  DeleteThemeItemProvider call({
    required String id,
    required String mediaId,
  }) {
    return DeleteThemeItemProvider(
      id: id,
      mediaId: mediaId,
    );
  }

  @override
  DeleteThemeItemProvider getProviderOverride(
    covariant DeleteThemeItemProvider provider,
  ) {
    return call(
      id: provider.id,
      mediaId: provider.mediaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteThemeItemProvider';
}

/// 테마 항목을 제거해요.
///
/// Copied from [deleteThemeItem].
class DeleteThemeItemProvider extends AutoDisposeFutureProvider<Theme> {
  /// 테마 항목을 제거해요.
  ///
  /// Copied from [deleteThemeItem].
  DeleteThemeItemProvider({
    required String id,
    required String mediaId,
  }) : this._internal(
          (ref) => deleteThemeItem(
            ref as DeleteThemeItemRef,
            id: id,
            mediaId: mediaId,
          ),
          from: deleteThemeItemProvider,
          name: r'deleteThemeItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteThemeItemHash,
          dependencies: DeleteThemeItemFamily._dependencies,
          allTransitiveDependencies:
              DeleteThemeItemFamily._allTransitiveDependencies,
          id: id,
          mediaId: mediaId,
        );

  DeleteThemeItemProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.mediaId,
  }) : super.internal();

  final String id;
  final String mediaId;

  @override
  Override overrideWith(
    FutureOr<Theme> Function(DeleteThemeItemRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteThemeItemProvider._internal(
        (ref) => create(ref as DeleteThemeItemRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        mediaId: mediaId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Theme> createElement() {
    return _DeleteThemeItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteThemeItemProvider &&
        other.id == id &&
        other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteThemeItemRef on AutoDisposeFutureProviderRef<Theme> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `mediaId` of this provider.
  String get mediaId;
}

class _DeleteThemeItemProviderElement
    extends AutoDisposeFutureProviderElement<Theme> with DeleteThemeItemRef {
  _DeleteThemeItemProviderElement(super.provider);

  @override
  String get id => (origin as DeleteThemeItemProvider).id;
  @override
  String get mediaId => (origin as DeleteThemeItemProvider).mediaId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

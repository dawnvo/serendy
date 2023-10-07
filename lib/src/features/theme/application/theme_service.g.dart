// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchMyThemesHash() => r'20c76cb3ec2efff98486147adffe6bbf29dc5127';

/// 나의 테마를 구독해요.
///
/// Copied from [watchMyThemes].
@ProviderFor(watchMyThemes)
final watchMyThemesProvider = StreamProvider<List<Theme?>>.internal(
  watchMyThemes,
  name: r'watchMyThemesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchMyThemesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchMyThemesRef = StreamProviderRef<List<Theme?>>;
String _$getThemesHash() => r'8aff11e49cfce1513cd49eb69b6e5b37d02ca208';

/// 테마 여럿을 불러와요.
///
/// Copied from [getThemes].
@ProviderFor(getThemes)
final getThemesProvider = AutoDisposeFutureProvider<List<Theme?>>.internal(
  getThemes,
  name: r'getThemesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getThemesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetThemesRef = AutoDisposeFutureProviderRef<List<Theme?>>;
String _$getThemeHash() => r'52b550de781885149f139d1be304927defd0caa7';

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
/// Copied from [getTheme].
@ProviderFor(getTheme)
const getThemeProvider = GetThemeFamily();

/// 테마를 불러와요.
///
/// Copied from [getTheme].
class GetThemeFamily extends Family<AsyncValue<Theme>> {
  /// 테마를 불러와요.
  ///
  /// Copied from [getTheme].
  const GetThemeFamily();

  /// 테마를 불러와요.
  ///
  /// Copied from [getTheme].
  GetThemeProvider call({
    required String id,
  }) {
    return GetThemeProvider(
      id: id,
    );
  }

  @override
  GetThemeProvider getProviderOverride(
    covariant GetThemeProvider provider,
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
  String? get name => r'getThemeProvider';
}

/// 테마를 불러와요.
///
/// Copied from [getTheme].
class GetThemeProvider extends AutoDisposeFutureProvider<Theme> {
  /// 테마를 불러와요.
  ///
  /// Copied from [getTheme].
  GetThemeProvider({
    required String id,
  }) : this._internal(
          (ref) => getTheme(
            ref as GetThemeRef,
            id: id,
          ),
          from: getThemeProvider,
          name: r'getThemeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getThemeHash,
          dependencies: GetThemeFamily._dependencies,
          allTransitiveDependencies: GetThemeFamily._allTransitiveDependencies,
          id: id,
        );

  GetThemeProvider._internal(
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
    FutureOr<Theme> Function(GetThemeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetThemeProvider._internal(
        (ref) => create(ref as GetThemeRef),
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
    return _GetThemeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetThemeProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetThemeRef on AutoDisposeFutureProviderRef<Theme> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetThemeProviderElement extends AutoDisposeFutureProviderElement<Theme>
    with GetThemeRef {
  _GetThemeProviderElement(super.provider);

  @override
  String get id => (origin as GetThemeProvider).id;
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

String _$getThemeItemsHash() => r'b21c2162e09827936a672d0c7b7dc6a95f576460';

/// 테마 항목을 불러와요.
///
/// Copied from [getThemeItems].
@ProviderFor(getThemeItems)
const getThemeItemsProvider = GetThemeItemsFamily();

/// 테마 항목을 불러와요.
///
/// Copied from [getThemeItems].
class GetThemeItemsFamily extends Family<AsyncValue<List<ThemeItem?>>> {
  /// 테마 항목을 불러와요.
  ///
  /// Copied from [getThemeItems].
  const GetThemeItemsFamily();

  /// 테마 항목을 불러와요.
  ///
  /// Copied from [getThemeItems].
  GetThemeItemsProvider call({
    required String id,
  }) {
    return GetThemeItemsProvider(
      id: id,
    );
  }

  @override
  GetThemeItemsProvider getProviderOverride(
    covariant GetThemeItemsProvider provider,
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
  String? get name => r'getThemeItemsProvider';
}

/// 테마 항목을 불러와요.
///
/// Copied from [getThemeItems].
class GetThemeItemsProvider
    extends AutoDisposeFutureProvider<List<ThemeItem?>> {
  /// 테마 항목을 불러와요.
  ///
  /// Copied from [getThemeItems].
  GetThemeItemsProvider({
    required String id,
  }) : this._internal(
          (ref) => getThemeItems(
            ref as GetThemeItemsRef,
            id: id,
          ),
          from: getThemeItemsProvider,
          name: r'getThemeItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getThemeItemsHash,
          dependencies: GetThemeItemsFamily._dependencies,
          allTransitiveDependencies:
              GetThemeItemsFamily._allTransitiveDependencies,
          id: id,
        );

  GetThemeItemsProvider._internal(
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
    FutureOr<List<ThemeItem?>> Function(GetThemeItemsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetThemeItemsProvider._internal(
        (ref) => create(ref as GetThemeItemsRef),
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
    return _GetThemeItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetThemeItemsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetThemeItemsRef on AutoDisposeFutureProviderRef<List<ThemeItem?>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetThemeItemsProviderElement
    extends AutoDisposeFutureProviderElement<List<ThemeItem?>>
    with GetThemeItemsRef {
  _GetThemeItemsProviderElement(super.provider);

  @override
  String get id => (origin as GetThemeItemsProvider).id;
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

/// 테마의 항목을 제거해요.
///
/// Copied from [deleteThemeItem].
@ProviderFor(deleteThemeItem)
const deleteThemeItemProvider = DeleteThemeItemFamily();

/// 테마의 항목을 제거해요.
///
/// Copied from [deleteThemeItem].
class DeleteThemeItemFamily extends Family<AsyncValue<Theme>> {
  /// 테마의 항목을 제거해요.
  ///
  /// Copied from [deleteThemeItem].
  const DeleteThemeItemFamily();

  /// 테마의 항목을 제거해요.
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

/// 테마의 항목을 제거해요.
///
/// Copied from [deleteThemeItem].
class DeleteThemeItemProvider extends AutoDisposeFutureProvider<Theme> {
  /// 테마의 항목을 제거해요.
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

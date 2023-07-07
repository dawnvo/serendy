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
String _$fetchThemesListHash() => r'070f56d6aab7cbeb3202cb56f0450269ba0865c4';

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
String _$fetchThemeHash() => r'81286509123bc3a7f6d795b6a4bf2f8411b60ae8';

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

typedef FetchThemeRef = AutoDisposeFutureProviderRef<Theme>;

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
    required this.id,
  }) : super.internal(
          (ref) => fetchTheme(
            ref,
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
        );

  final String id;

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

String _$createThemeHash() => r'feaafa94f0263173da92603fea0b93690b48fb0b';
typedef CreateThemeRef = AutoDisposeFutureProviderRef<Theme>;

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
    required this.title,
  }) : super.internal(
          (ref) => createTheme(
            ref,
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
        );

  final String title;

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

String _$editThemeHash() => r'ba2f85b3cb63e75c443712b65fdcb20da3d0def2';
typedef EditThemeRef = AutoDisposeFutureProviderRef<Theme>;

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
    required this.id,
    required this.title,
    this.description,
    this.image,
    this.private,
  }) : super.internal(
          (ref) => editTheme(
            ref,
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
        );

  final String id;
  final String title;
  final String? description;
  final String? image;
  final bool? private;

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

String _$removeThemeHash() => r'4b9dd72b11a90e962e69a3b7c06885a19c592cc1';
typedef RemoveThemeRef = AutoDisposeFutureProviderRef<void>;

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
    required this.id,
  }) : super.internal(
          (ref) => removeTheme(
            ref,
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
        );

  final String id;

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

String _$addThemeItemHash() => r'3c93a8379be44f00ff74b1a380242d6fed4b2451';
typedef AddThemeItemRef = AutoDisposeFutureProviderRef<Theme>;

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
    required this.id,
    required this.mediaId,
  }) : super.internal(
          (ref) => addThemeItem(
            ref,
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
        );

  final String id;
  final String mediaId;

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

String _$deleteThemeItemHash() => r'4c341c0ed91e1399d97519c1c10f759b2292a9a6';
typedef DeleteThemeItemRef = AutoDisposeFutureProviderRef<Theme>;

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
    required this.id,
    required this.mediaId,
  }) : super.internal(
          (ref) => deleteThemeItem(
            ref,
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
        );

  final String id;
  final String mediaId;

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

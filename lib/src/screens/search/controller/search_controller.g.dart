// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchQueryControllerHash() =>
    r'dfd2e655f8c0f0a98359a886b1ac343c75826980';

/// See also [searchQueryController].
@ProviderFor(searchQueryController)
final searchQueryControllerProvider =
    AutoDisposeProvider<TextEditingController>.internal(
  searchQueryController,
  name: r'searchQueryControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchQueryControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchQueryControllerRef
    = AutoDisposeProviderRef<TextEditingController>;
String _$searchControllerHash() => r'69e7f80d694f2101b95760fc2aca828f4ba773ab';

/// See also [SearchController].
@ProviderFor(SearchController)
final searchControllerProvider =
    AutoDisposeAsyncNotifierProvider<SearchController, SearchState>.internal(
  SearchController.new,
  name: r'searchControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchController = AutoDisposeAsyncNotifier<SearchState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

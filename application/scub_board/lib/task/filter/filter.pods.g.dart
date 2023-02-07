// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.pods.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String $FiltersManagerHash() => r'b5a886a0683d3fb603451b0e06486f62995d0909';

/// Filters manager see [TaskFilter]
///
/// Copied from [FiltersManager].
final filtersManagerProvider =
    AutoDisposeNotifierProvider<FiltersManager, TaskFilter>(
  FiltersManager.new,
  name: r'filtersManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $FiltersManagerHash,
);
typedef FiltersManagerRef = AutoDisposeNotifierProviderRef<TaskFilter>;

abstract class _$FiltersManager extends AutoDisposeNotifier<TaskFilter> {
  @override
  TaskFilter build();
}

String $filterTasksHash() => r'860d625f2546ddfea382ee99d3b1216934c3bc07';

/// Trigger filtered [Tasks]
///
/// Copied from [filterTasks].
final filterTasksProvider = AutoDisposeProvider<Iterable<Task<dynamic>>>(
  filterTasks,
  name: r'filterTasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $filterTasksHash,
);
typedef FilterTasksRef = AutoDisposeProviderRef<Iterable<Task<dynamic>>>;
String $isSelectedFilterHash() => r'8d1a99d22fd86543411dfe3fa918503cfd8f2f52';

/// See also [isSelectedFilter].
class IsSelectedFilterProvider extends AutoDisposeProvider<bool> {
  IsSelectedFilterProvider(
    this.filterTask,
  ) : super(
          (ref) => isSelectedFilter(
            ref,
            filterTask,
          ),
          from: isSelectedFilterProvider,
          name: r'isSelectedFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $isSelectedFilterHash,
        );

  final TaskFilter filterTask;

  @override
  bool operator ==(Object other) {
    return other is IsSelectedFilterProvider && other.filterTask == filterTask;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filterTask.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef IsSelectedFilterRef = AutoDisposeProviderRef<bool>;

/// See also [isSelectedFilter].
final isSelectedFilterProvider = IsSelectedFilterFamily();

class IsSelectedFilterFamily extends Family<bool> {
  IsSelectedFilterFamily();

  IsSelectedFilterProvider call(
    TaskFilter filterTask,
  ) {
    return IsSelectedFilterProvider(
      filterTask,
    );
  }

  @override
  AutoDisposeProvider<bool> getProviderOverride(
    covariant IsSelectedFilterProvider provider,
  ) {
    return call(
      provider.filterTask,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'isSelectedFilterProvider';
}

String $availableFiltersHash() => r'15e7575b3bf98a5c61865dffe8233060ad3273fb';

/// See also [availableFilters].
final availableFiltersProvider = AutoDisposeProvider<Iterable<TaskFilter>>(
  availableFilters,
  name: r'availableFiltersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $availableFiltersHash,
);
typedef AvailableFiltersRef = AutoDisposeProviderRef<Iterable<TaskFilter>>;

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.pods.dart';

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

String $labelsSourceHash() => r'34a01e6134f4f98928ea53899f228211823c6b97';

/// Source [Labels]
///
/// Copied from [labelsSource].
final labelsSourceProvider = AutoDisposeFutureProvider<Iterable<Label>>(
  labelsSource,
  name: r'labelsSourceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $labelsSourceHash,
);
typedef LabelsSourceRef = AutoDisposeFutureProviderRef<Iterable<Label>>;
String $sourceTasksHash() => r'a5ad451f96e1a82dc5d0456c88072b9fbfeaf323';

/// Source raw [Tasks]
///
/// Copied from [sourceTasks].
class SourceTasksProvider
    extends AutoDisposeFutureProvider<Iterable<Task<dynamic>>> {
  SourceTasksProvider({
    this.limit = 55,
  }) : super(
          (ref) => sourceTasks(
            ref,
            limit: limit,
          ),
          from: sourceTasksProvider,
          name: r'sourceTasksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $sourceTasksHash,
        );

  final int limit;

  @override
  bool operator ==(Object other) {
    return other is SourceTasksProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SourceTasksRef = AutoDisposeFutureProviderRef<Iterable<Task<dynamic>>>;

/// Source raw [Tasks]
///
/// Copied from [sourceTasks].
final sourceTasksProvider = SourceTasksFamily();

class SourceTasksFamily extends Family<AsyncValue<Iterable<Task<dynamic>>>> {
  SourceTasksFamily();

  SourceTasksProvider call({
    int limit = 55,
  }) {
    return SourceTasksProvider(
      limit: limit,
    );
  }

  @override
  AutoDisposeFutureProvider<Iterable<Task<dynamic>>> getProviderOverride(
    covariant SourceTasksProvider provider,
  ) {
    return call(
      limit: provider.limit,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'sourceTasksProvider';
}

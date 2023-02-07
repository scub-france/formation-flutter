import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../task.dart';
import '../task.pods.dart';
import 'filter.dart';

part 'filter.pods.g.dart';

/// Filters manager see [TaskFilter]
@Riverpod()
class FiltersManager extends _$FiltersManager {
  @override
  TaskFilter build() {
    ref
      ..onDispose(() => print("${this} disposed"))
      ..listenSelf((_, filter) => print("Filtering by ${filter.id}"));

    return const NoOpFilter();
  }

  /// Update active [TaskFilter]
  void activate(TaskFilter filter) => state = filter;
}

/// Trigger filtered [Tasks]
@riverpod
Tasks filterTasks(FilterTasksRef ref) {
  // Recevoir toutes les tâches disponibles
  final source = ref.watch(sourceTasksProvider());
  // Recevoir le filtre sélectionné
  final filter = ref.watch(filtersManagerProvider);
  // Emettre une nouvelle liste de tâches filtrés
  return source.maybeMap(data: (data) => filter.filter(data.value), orElse: () => []);
}

@riverpod
bool isSelectedFilter(IsSelectedFilterRef ref, TaskFilter filterTask) {
  final filter = ref.watch(filtersManagerProvider);
  return filter.id == filterTask.id;
}

@riverpod
Iterable<TaskFilter> availableFilters(AvailableFiltersRef ref) => const [
      NoOpFilter(),
      StatusFilter(id: "Done", by: TaskStatus.done),
      ComposedFilter(id: "Archived", filters: [
        StatusFilter(id: 'Done', by: TaskStatus.done),
        StatusFilter(id: 'Canceled', by: TaskStatus.cancelled),
        PriorityFilter(id: 'High priority', by: TaskPriority.high),
        LabelFilter(id: 'Design', by: Label('design', color: Colors.greenAccent)),
        AssignedFilter(id: 'assignedBy', by: 'Ludovic Courbis'),
      ]),
      PriorityFilter(id: 'High priority', by: TaskPriority.high),
      LabelFilter(id: 'Design', by: Label('design', color: Colors.greenAccent)),
      ComposedFilter(id: 'Composed', filters: [NoOpFilter()]),
    ];

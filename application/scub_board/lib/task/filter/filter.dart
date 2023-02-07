import 'package:flutter/cupertino.dart';

import '../task.dart';

/// Filter from [Tasks] to [Tasks]
@immutable
abstract class TaskFilter {
  /// uid
  final String id;

  /// Markdown desc
  final String content;

  const TaskFilter({required this.id, this.content = ''});

  Tasks filter(Tasks tasks);

  @override
  toString() => 'Task{id: $id, content: $content}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TaskFilter && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

/// Identity Filter
@immutable
class NoOpFilter extends TaskFilter {
  const NoOpFilter() : super(id: 'noop');

  @override
  filter(tasks) => tasks;
}

/// Filter by [TaskStatus]
@immutable
class StatusFilter extends TaskFilter {
  final TaskStatus by;

  const StatusFilter({required super.id, required this.by});

  @override
  filter(tasks) => tasks.where((task) => task.status == by);
}

/// Filter by [TaskStatus]
@immutable
class PriorityFilter extends TaskFilter {
  final TaskPriority by;

  const PriorityFilter({required super.id, required this.by});

  @override
  filter(tasks) => tasks.where((task) => task.priority == by);
}

/// Filter by Labels
@immutable
class LabelFilter extends TaskFilter {
  final Label by;

  const LabelFilter({required super.id, required this.by});

  @override
  filter(tasks) => tasks.where((task) => task.labels.map((l) => l.content).contains(by.content)).toList();
}

@immutable
class AssignedFilter extends TaskFilter {
  final Uid by;

  const AssignedFilter({required super.id, required this.by});

  @override
  filter(tasks) => tasks.where((task) => task.assigned == by).toList();
}

@immutable
class ByFilter extends TaskFilter {
  final Uid by;

  const ByFilter({required super.id, required this.by});

  @override
  filter(tasks) => tasks.where((task) => task.by == by).toList();
}

// ================== Composed ==================

/// Compose Filters and merge Tasks
@immutable
class ComposedFilter extends TaskFilter {
  final Iterable<TaskFilter> filters;

  const ComposedFilter({required super.id, required this.filters});

  @override
  filter(tasks) {
    final rs = <Task>{};
    for (final filter in filters) rs.addAll(filter.filter(tasks));
    return rs;
  }
}

/// Retains composition of [AssignedFilter] & [ByFilter]
@immutable
class MyIssuesFilter extends ComposedFilter {
  MyIssuesFilter({required Uid by})
      : super(id: 'MyIssue', filters: [
          AssignedFilter(id: 'Composed Assigned', by: by),
          ByFilter(id: 'Composed By', by: by),
        ]);
}

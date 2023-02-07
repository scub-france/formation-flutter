import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'task.dart';

part 'task.pods.g.dart';

/// Source [Labels]
@riverpod
Future<Labels> labelsSource(LabelsSourceRef ref) => Future.value(const [
      Label('design', color: Colors.greenAccent),
      Label('ux', color: Colors.blueAccent),
      Label('Ubiq', color: Colors.redAccent),
      Label('demo', color: Colors.amberAccent),
      Label('Maxit', color: Colors.pink),
    ]);

/// Source raw [Tasks]
@riverpod
Future<Tasks> sourceTasks(SourceTasksRef ref, {int limit = 55}) async {
  final rdm = Random();
  final labelsBase = await ref.read(labelsSourceProvider.future);

  final bases = List.generate(limit, (idx) {
    final labels = labelsBase.toList()..shuffle();
    final status = TaskStatus.values.toList()..shuffle();
    final priority = TaskPriority.values.toList()..shuffle();
    final comments = commentsBase.toList()..shuffle();
    final users = usersBase.toList()..shuffle();

    return Task(
      id: 'FIR-$idx',
      content: comments.first,
      status: status.first,
      priority: priority.first,
      labels: labels.take(rdm.nextInt(3)),
      subs: List.generate(
          rdm.nextInt(4),
          (index) =>
              _generateRandomTaskMaybeNull(labelsBase, index, isSub: true)!),
      assigned: users.first,
      by: users.last,
      blockedBy: _generateRandomTaskMaybeNull(labelsBase, idx),
      blocking: _generateRandomTaskMaybeNull(labelsBase, idx),
      duplicateOf: _generateRandomTaskMaybeNull(labelsBase, idx),
    );
  });

  return Future.value(bases);
}

Task? _generateRandomTaskMaybeNull(Iterable<Label> labelsBase, int idx,
    {bool isSub = false}) {
  final rdm = Random();

  if (!isSub && idx % 5 == 0) return null;

  final labels = labelsBase.toList()..shuffle();
  final status = TaskStatus.values.toList()..shuffle();
  final priority = TaskPriority.values.toList()..shuffle();
  final comments = commentsBase.toList()..shuffle();
  final users = usersBase.toList()..shuffle();

  return Task(
    id: 'FIR-${idx + rdm.nextInt(7)}',
    content: comments.last,
    status: status.last,
    priority: priority.last,
    labels: labels.take(rdm.nextInt(5)),
    assigned: users.last,
    by: users.first,
  );
}

const commentsBase = [
  "[riverpod_generator] ability to change 'Provider' postix to something else #1851 enhancement New feature or requestquestionFurther information is requested",
  "build_verify test with riverpod generator",
  "AutoDisposeProvider does not recreate value in nested ScopedProvider bug Something isn't workingquestionFurther information is requested",
  "Widget test fails with pending timers with auto-dispose provider bug Something isn't workingneeds triage",
  "Reduce boiler plate code for 'mounted' in the new AsyncNotifier class. enhancement New feature or requestneeds triage",
  "Assert throws: '_builtFuture == null': Bad state bug Something isn't workingneeds triage",
  "Riverpod should depend on state_notifier >= 0.7.2 bug Something isn't workingneeds triage",
  "WidgetRef.listenManual subscriptions should be closed after State.dispose is executed instead of before bugSomething isn't working",
  "State stops working after hot reload or restart in 2.1.1 (lib/src/framework.dart :325:12) bug Something isn't workingneeds triage",
  "Iterating a List on ref.onDispose and build will throw error bug Something isn't workingneeds triage",
  "mounted property on Notifier/AsyncNotifier questionFurther information is requested",
  "ProviderContainer weirdly catches and handles unintended errors bug Something isn't workingneeds triage",
  "Tried to read [Provider] from a place where one of its dependencies were overridden but the provider is not. When using 2 ProviderScope bugSomething isn't working",
  "Additional generic interfaces for families and async providers enhancement New feature or requestquestionFurther information is requested",
  "FutureProvider/AsyncNotifier loses previous value when its rebuild resulting in AsyncError bug Something isn't workingneeds triage",
  "[riverpod_generator] ability to change 'Provider' postix to something else enhancement New feature or requestgood first issue Good for newcomersriverpod_generator",
  "Throw if a listener tries to modify a provider breaking enhancementNew feature or request",
  "Explain more about why StateNotifier is preferred over ChangeNotifier documentationImprovements or additions to documentation",
  "[riverpod_generator] Warn users about unsupported type enhancement New feature or requestriverpod_generator",
  "Support generated types as return type for generated providers enhancement New feature or requestriverpod_generator",
  "Expose utilities to avoid UI flickers when asynchronous providers update enhancementNew feature or request",
  "Document AsyncNotifier documentationImprovements or additions to documentation",
  "Documentation rework plan",
];

const usersBase = [
  "Ludovic Courbis",
  "Henri Charbonnier",
  "Laurent Gounelle",
  "Éloi Chauve",
  "Jean Asselin",
  "Hubert Crevier",
  "Guillaume Lemoine",
  "Michaël Dutoit",
  "Sylvain Choffard",
  "Lambert Cellier"
];

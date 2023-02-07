import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../filter/filter.dart';
import '../filter/filter.pods.dart';
import '../task.dart';
import 'display.dart';

part 'display.pods.g.dart';

/// Manage navigation between [Task] and [Tasks]
@Riverpod(keepAlive: true)
class DisplayManager extends _$DisplayManager {
  DisplayMode _memorized = const DisplayMode.filter();

  /// Init with [NoOpFilter]
  @override
  DisplayMode build() {
    ref.listenSelf((_, mode) {
      mode.maybeWhen(
          filter: (filter) {
            /// Filter mode will memorized the current filter and active it
            ref.read(filtersManagerProvider.notifier).activate(filter);
            _memorized = mode;
            return DisplayMode.filter(filter: filter);
          },
          orElse: () => const DisplayMode.filter());

      print('Status' '\nMemorised: $_memorized' '\nCurrent: $state');
    });

    return const DisplayMode.filter();
  }

  void filter(TaskFilter filter) => state = DisplayMode.filter(filter: filter);

  void defaultFilter() => state = _memorized;

  void task(Task task) => state = DisplayMode.task(task);
}

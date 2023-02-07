import 'package:freezed_annotation/freezed_annotation.dart';

import '../filter/filter.dart';
import '../task.dart';

part 'display.freezed.dart';

/// Exhaustive Display modes
@freezed
class DisplayMode with _$DisplayMode {
  const factory DisplayMode.filter({@Default(NoOpFilter()) TaskFilter filter}) = FilterDisplayMode;
  const factory DisplayMode.task(Task task) = TaskDisplayMode;
}
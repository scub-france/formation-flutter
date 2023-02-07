import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

typedef Tasks = Iterable<Task>;
typedef Uid = String;
typedef Labels = Iterable<Label>;

@freezed
class Task<T> with _$Task<T> {
  Task._();

  factory Task({
    required String id,
    // TODO(Robert): default value limitation
    @Default('20 nov') String created,
    @Default('') String content,
    @Default([]) Labels labels,
    @Default([]) Tasks subs,
    @Default(TaskStatus.fresh) TaskStatus status,
    @Default(TaskPriority.noPriority) TaskPriority priority,
    Task? blockedBy,
    Task? blocking,
    Task? duplicateOf,
    @Default('') Uid assigned,
    @Default('') Uid by,
  }) = _Task<T>;

  void hello() => "Go";

//const factory Task.today(String name) = _Task<T>;

}

/// [Task] Label
class Label {
  final String content;
  final Color color;

  const Label(this.content, {this.color = Colors.black12});

  @override
  toString() => 'Label{content: $content}';
}

const _iconSize = 18.0;
const _iconColor = Colors.white38;

enum TaskPriority {
  noPriority("Aucune", Icon(Icons.horizontal_rule_rounded, size: _iconSize, color: _iconColor)),
  urgent("Urgent", Icon(Icons.warning_amber_rounded, size: _iconSize, color: _iconColor)),
  high("Haute", Icon(Icons.signal_cellular_alt_rounded, size: _iconSize, color: _iconColor)),
  medium("Médium", Icon(Icons.signal_cellular_alt_2_bar_rounded, size: _iconSize, color: _iconColor)),
  low("Basse", Icon(Icons.signal_cellular_alt_1_bar_rounded, size: _iconSize, color: _iconColor));

  final String display;
  final Icon icon;

  const TaskPriority(this.display, this.icon);
}

enum TaskStatus {
  todo("A Faire", Icon(Icons.play_for_work, size: _iconSize, color: _iconColor)),
  fresh("Nouveau", Icon(Icons.new_label_outlined, size: _iconSize, color: _iconColor)),
  backlog("Backlog", Icon(Icons.list_alt, size: _iconSize, color: _iconColor)),
  inProgress("En cours", Icon(Icons.access_time_sharp, size: _iconSize, color: _iconColor)),
  done("Fait", Icon(Icons.check, size: _iconSize, color: _iconColor)),
  cancelled("Annulé", Icon(Icons.cancel_outlined, size: _iconSize, color: _iconColor));

  final String display;
  final Icon icon;

  const TaskStatus(this.display, this.icon);
}

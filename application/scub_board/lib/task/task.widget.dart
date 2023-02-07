import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tap_builder/tap_builder.dart';

import 'comments/comment.widget.dart';
import 'display/display.dart';
import 'display/display.pods.dart';
import 'display/display.widget.dart';
import 'filter/filter.dart';
import 'task.dart';

const _subColor = Colors.white38;

/// [Task] Entry for each line
class TaskEntry extends ConsumerWidget {
  final Task task;

  const TaskEntry(this.task, {super.key});

  @override
  build(_, ref) => TapBuilder(
      onTap: () => ref.read(displayManagerProvider.notifier).task(task),
      builder: (ctx, state, isFocused) => AnimatedContainer(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(isFocused ? .2 : .0),
                width: 2,
              ),
              color: () {
                switch (state) {
                  case TapState.disabled:
                    return Colors.grey;
                  case TapState.hover:
                    return Colors.white12;
                  case TapState.inactive:
                    return Colors.transparent;
                  case TapState.pressed:
                    return Colors.lightBlueAccent;
                }
              }(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text(task.id),

                // Left Part
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      Tooltip(
                        message: task.priority.display,
                        child: task.priority.icon,
                      ),
                      const _Spacer(),
                      Tooltip(
                        message: task.status.display,
                        child: task.status.icon,
                      ),
                      const _Spacer(),
                      Flexible(
                        child: Text(
                          task.content,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                // Right Part
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Wrap(spacing: 4, children: task.labels.map(TaskLabelChip.new).toList()),
                      const _Spacer(),
                      Text(task.created, style: const TextStyle(color: _subColor)),
                      const _Spacer(),
                      GestureDetector(
                          onTap: () => ref
                              .read(displayManagerProvider.notifier)
                              .filter(AssignedFilter(id: 'AssignedFilter_by_${task.assigned}', by: task.assigned)),
                          child: Tooltip(
                            message: task.assigned,
                            child: const Icon(Icons.account_circle, color: _subColor),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ));
}

/// [TaskDetail]
class TaskDetail extends ConsumerWidget {
  const TaskDetail({super.key});

  // Flex layout
  static const _layout = [3, 1];

  @override
  build(_, ref) {
    final display = ref.watch(displayManagerProvider) as TaskDisplayMode;
    return DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            SizedBox(height: 30, child: _buildHeader(ref, display)),
            Expanded(child: _buildBody(ref, display)),
          ],
        ));
  }

  Widget _buildBody(WidgetRef ref, TaskDisplayMode display) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: _layout.first,
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  SizedBox(height: 120, child: Text(display.task.content)),
                  Expanded(child: CommentList(display.task))
                ],
              )),
          Flexible(
            flex: _layout.last,
            child: TaskProperties(task: display.task),
          ),
        ],
      );

  Widget _buildHeader(WidgetRef ref, TaskDisplayMode display) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: _layout.first,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => ref.read(displayManagerProvider.notifier).defaultFilter(),
                      child: const Icon(Icons.close)),
                  Expanded(child: Text(display.task.id))
                ],
              )),
          Flexible(
            flex: _layout.last,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.link_sharp,
                  color: _subColor,
                ),
                _Spacer(),
                Icon(
                  Icons.link_sharp,
                  color: _subColor,
                ),
                _Spacer(),
                Icon(
                  Icons.link_sharp,
                  color: _subColor,
                ),
              ],
            ),
          ),
        ],
      );
}

class TaskProperties extends ConsumerWidget {
  final Task task;

  const TaskProperties({super.key, required this.task});

  @override
  build(_, ref) => Column(
        children: [
          ListTile(
              leading: const Text("Creation"),
              title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [Text(task.created)])),
          TaskPropertyIcon(
            label: "Status",
            icon: task.status.icon,
            displayText: task.status.display,
            onTap: () => ref.read(displayManagerProvider.notifier).filter(StatusFilter(id: 'Status', by: task.status)),
          ),
          TaskPropertyIcon(
              label: "Priority",
              icon: task.priority.icon,
              displayText: task.priority.display,
              onTap: () => ref.read(displayManagerProvider.notifier).filter(PriorityFilter(
                    id: 'Priority',
                    by: task.priority,
                  ))),
          if (task.labels.isNotEmpty)
            ListTile(
              leading: const Text('Labels'),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Wrap(alignment: WrapAlignment.end, spacing: 4, children: task.labels.map(TaskLabelChip.new).toList()),
                ],
              ),
            ),
          if (task.assigned.isNotEmpty)
            TaskPropertyIcon(
              label: "Assigned",
              icon: const Icon(Icons.account_circle, size: 18, color: Colors.white38),
              displayText: task.assigned,
              onTap: () =>
                  ref.read(displayManagerProvider.notifier).filter(AssignedFilter(id: 'assignedBy', by: task.assigned)),
            ),
          if (task.by.isNotEmpty)
            TaskPropertyIcon(
              label: "By",
              icon: const Icon(Icons.account_circle, size: 18, color: Colors.white38),
              displayText: task.by,
              onTap: () => ref.read(displayManagerProvider.notifier).filter(ByFilter(id: 'ByFilter', by: task.by)),
            ),
          if (task.subs.isNotEmpty)
            ListTile(
              leading: const Text('Subs tasks'),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Wrap(
                      alignment: WrapAlignment.end,
                      spacing: 4,
                      children: task.subs
                          .map((sub) => GestureDetector(
                              onTap: () => ref.read(displayManagerProvider.notifier).task(sub),
                              child: LabelChip(Label(sub.id))))
                          .toList()),
                ],
              ),
            ),
          if (task.blockedBy != null)
            TaskPropertyWithoutIcon(
              label: "Blocked by",
              displayText: task.blockedBy!.id,
              onTap: () => ref.read(displayManagerProvider.notifier).task(task.blockedBy!),
            ),
          if (task.blocking != null)
            TaskPropertyWithoutIcon(
              label: "Blocking",
              displayText: task.blocking!.id,
              onTap: () => ref.read(displayManagerProvider.notifier).task(task.blocking!),
            ),
          if (task.duplicateOf != null)
            TaskPropertyWithoutIcon(
              label: "Duplicated of",
              displayText: task.duplicateOf!.id,
              onTap: () => ref.read(displayManagerProvider.notifier).task(task.duplicateOf!),
            ),
        ],
      );
}

/// Space between [Task] properties
class _Spacer extends StatelessWidget {
  const _Spacer();

  @override
  build(_) => const SizedBox(width: 10);
}

class TaskPropertyIcon extends StatelessWidget {
  final String label;
  final Icon icon;
  final String displayText;
  final VoidCallback onTap;

  const TaskPropertyIcon(
      {required this.label, required this.icon, required this.displayText, required this.onTap, super.key});

  @override
  build(_) => ListTile(
      leading: Text(label),
      title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Tooltip(
            message: displayText,
            child: GestureDetector(onTap: onTap, child: IconLabelChip(icon: icon, label: Label(displayText))))
      ]));
}

class TaskPropertyWithoutIcon extends StatelessWidget {
  final String label;
  final String displayText;
  final VoidCallback onTap;

  const TaskPropertyWithoutIcon({required this.label, required this.displayText, required this.onTap, super.key});

  @override
  build(_) => ListTile(
      leading: Text(label),
      title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Tooltip(message: displayText, child: GestureDetector(onTap: onTap, child: LabelChip(Label(displayText))))
      ]));
}

/// Chip for each [Label] in a [Task]
class TaskLabelChip extends ConsumerWidget {
  final Label label;

  const TaskLabelChip(this.label, {super.key});

  @override
  build(_, ref) => GestureDetector(
        onTap: () =>
            ref.read(displayManagerProvider.notifier).filter(LabelFilter(id: '"${label.content}" Filter', by: label)),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Color.lerp(Colors.black12, label.color, .1),
                  border: Border.all(color: Color.lerp(Colors.black12, label.color, .65)!, width: .8),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    label.content,
                    style: const TextStyle(color: _subColor),
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(width: 4),
                  SizedBox(
                    width: 6,
                    height: 6,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                      color: label.color,
                      shape: BoxShape.circle,
                    )),
                  ),
                  const _Spacer(),
                ],
              ),
            ),
          ],
        ),
      );
}

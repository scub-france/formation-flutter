import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../filter/filter.dart';
import '../filter/filter.pods.dart';
import '../task.dart';
import '../task.widget.dart';
import 'display.dart';
import 'display.pods.dart';

/// Switch between [Tasks] and [Task]
class Display extends ConsumerWidget {
  const Display({super.key});

  @override
  build(ctx, ref) {
    final mode = ref.watch(displayManagerProvider);
    final tasks = ref.watch(filterTasksProvider);

    return SizedBox.expand(
      child: ColoredBox(
        color: Colors.black38,
        child: Column(
          children: [
            const FilterHeader(),
            SizedBox(
                height: 80,
                child: Expanded(
                  child: AnimatedContainer(
                    color: Theme.of(ctx).scaffoldBackgroundColor,
                    duration: const Duration(milliseconds: 250),
                    margin: mode.when(
                      filter: (filter) => const EdgeInsets.all(2),
                      task: (task) => const EdgeInsets.all(16),
                    ),
                    child: _swap(mode, tasks),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  // Swap content
  Widget _swap(DisplayMode mode, Tasks tasks) => mode.when(
        filter: (filter) => ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) => TaskEntry(tasks.elementAt(index))),
        task: (task) => Container(
          margin: const EdgeInsets.all(16),
          child: const TaskDetail(),
        ),
      );
}

/// Describe selected [TaskFilter] properties
class FilterHeader extends ConsumerWidget {
  const FilterHeader({super.key});

  @override
  build(_, ref) {
    final filter = ref.watch(filtersManagerProvider);

    return filter is NoOpFilter
        ? Center(
            child: Text(
              filter.id,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ComplexFilterWidget(filter);
  }
}

class ComplexFilterWidget extends StatelessWidget {
  final TaskFilter filter;

  const ComplexFilterWidget(this.filter, {super.key});

  @override
  build(_) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              filter.id,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TaskFilterByType(filter),
          ],
        ),
      );
}

class TaskFilterByType extends StatelessWidget {
  final TaskFilter filter;

  const TaskFilterByType(this.filter, {super.key});

  @override
  build(_) {
    switch (filter.runtimeType) {
      case NoOpFilter:
        return const IconLabelChip(
            icon: Icon(Icons.filter_alt_off_rounded, size: 18, color: Colors.white38), label: Label('No filters'));
      case LabelFilter:
        LabelFilter labelFilter = filter as LabelFilter;
        return LabelChip(labelFilter.by);
      case AssignedFilter:
        AssignedFilter byFilter = filter as AssignedFilter;
        return IconLabelChip(
            icon: const Icon(Icons.account_circle, size: 18, color: Colors.white38), label: Label(byFilter.by));
      case ByFilter:
        ByFilter byFilter = filter as ByFilter;
        return IconLabelChip(icon: const Icon(Icons.abc, size: 18, color: Colors.white38), label: Label(byFilter.by));
      case PriorityFilter:
        PriorityFilter priorityFilter = filter as PriorityFilter;
        return IconLabelChip(icon: priorityFilter.by.icon, label: Label(priorityFilter.by.display));
      case StatusFilter:
        StatusFilter statusFilter = filter as StatusFilter;
        return IconLabelChip(icon: statusFilter.by.icon, label: Label(statusFilter.by.display));
      default:
        return ComposedFilterDetails(filter as ComposedFilter);
    }
  }
}

class ComposedFilterDetails extends StatelessWidget {
  final ComposedFilter filter;

  const ComposedFilterDetails(this.filter, {super.key});

  @override
  build(_) => Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: filter.filters.length,
          itemBuilder: (_, int index) {
            TaskFilter taskFilter = filter.filters.elementAt(index);
            switch (taskFilter.runtimeType) {
              case LabelFilter:
                LabelFilter labelFilter = taskFilter as LabelFilter;
                return LabelChip(labelFilter.by);
              case AssignedFilter:
                AssignedFilter byFilter = taskFilter as AssignedFilter;
                return IconLabelChip(
                    icon: const Icon(Icons.account_circle, size: 18, color: Colors.white38), label: Label(byFilter.by));
              case ByFilter:
                ByFilter byFilter = taskFilter as ByFilter;
                return IconLabelChip(
                    icon: const Icon(Icons.abc, size: 18, color: Colors.white38), label: Label(byFilter.by));
              case StatusFilter:
                StatusFilter statusFilter = taskFilter as StatusFilter;
                return IconLabelChip(icon: statusFilter.by.icon, label: Label(statusFilter.by.display));
              case PriorityFilter:
                PriorityFilter priorityFilter = taskFilter as PriorityFilter;
                return IconLabelChip(icon: priorityFilter.by.icon, label: Label(priorityFilter.by.display));
              default:
                return const IconLabelChip(
                    icon: Icon(Icons.filter_alt_off_rounded, size: 18, color: Colors.white38),
                    label: Label('No filters'));
            }
          },
          separatorBuilder: (_, int index) => const SizedBox(width: 16.0),
        ),
      );
}

class LabelChip extends StatelessWidget {
  final Label label;

  const LabelChip(this.label, {super.key});

  @override
  build(_) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white12, width: .8),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Text(
                  label.content,
                  style: const TextStyle(color: Colors.white38),
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
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      );
}

class IconLabelChip extends StatelessWidget {
  final Icon icon;
  final Label label;

  const IconLabelChip({required this.icon, required this.label, super.key});

  @override
  build(_) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white12, width: .8),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                const SizedBox(width: 8.0),
                icon,
                const SizedBox(width: 4),
                Text(
                  label.content,
                  style: const TextStyle(color: Colors.white38),
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(width: 8.0),
              ],
            ),
          ),
        ],
      );
}

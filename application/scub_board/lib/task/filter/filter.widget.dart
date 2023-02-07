import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tap_builder/tap_builder.dart';

import '../display/display.pods.dart';
import 'filter.dart';
import 'filter.pods.dart';

/// Display configured [TaskFilter]
class FiltersList extends ConsumerWidget {
  const FiltersList({super.key});

  @override
  build(context, ref) => DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).focusColor),
        child: ListView(
          children: [
            const SizedBox(height: 80, child: Center(child: FlutterLogo(size: 60))),
            ...ref.watch(availableFiltersProvider).map(FilterListEntry.new).toList(),
          ],
        ),
      );
}

/// Display a [TaskFilter] as a list entry
class FilterListEntry extends ConsumerWidget {
  final TaskFilter filter;

  const FilterListEntry(this.filter, {super.key});

  @override
  build(_, ref) => TapBuilder(
        onTap: () => ref.read(displayManagerProvider.notifier).filter(filter),
        builder: (ctx, state, isFocused) => AnimatedContainer(
          constraints: const BoxConstraints(minHeight: 50),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(isFocused ? .2 : .0),
              width: 2,
            ),
            color: () {
              bool isSelectedFilter = ref.watch(isSelectedFilterProvider(filter));

              if (isSelectedFilter) {
                return Colors.white24;
              } else {
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
              }
            }(),
          ),
          child: TileTaskFilterMapping(filter),
        ),
      );
}

class TileTaskFilterMapping extends StatelessWidget {
  final TaskFilter taskFilter;

  const TileTaskFilterMapping(this.taskFilter, {super.key});

  @override
  build(_) {
    switch (taskFilter.runtimeType) {
      case NoOpFilter:
        NoOpFilter noOpFilter = taskFilter as NoOpFilter;
        return TileTaskFilter(icon: const Icon(Icons.filter_alt_off_rounded), label: noOpFilter.id);
      case LabelFilter:
        LabelFilter labelFilter = taskFilter as LabelFilter;
        return TileTaskFilter(icon: Icon(Icons.circle, color: labelFilter.by.color), label: labelFilter.by.content);
      case AssignedFilter:
        AssignedFilter byFilter = taskFilter as AssignedFilter;
        return TileTaskFilter(icon: const Icon(Icons.account_circle), label: byFilter.by);
      case ByFilter:
        ByFilter byFilter = taskFilter as ByFilter;
        return TileTaskFilter(icon: const Icon(Icons.abc), label: byFilter.by);
      case PriorityFilter:
        PriorityFilter priorityFilter = taskFilter as PriorityFilter;
        return TileTaskFilter(icon: priorityFilter.by.icon, label: priorityFilter.by.display);
      case StatusFilter:
        StatusFilter statusFilter = taskFilter as StatusFilter;
        return TileTaskFilter(icon: statusFilter.by.icon, label: statusFilter.by.display);
      default:
        return TileComposedTaskFilter(taskFilter as ComposedFilter);
    }
  }
}

class TileTaskFilter extends StatelessWidget {
  final Icon icon;
  final String label;

  const TileTaskFilter({required this.icon, required this.label, super.key});

  @override
  build(_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(children: [
          icon,
          const SizedBox(width: 8.0),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ]),
      );
}

class TileComposedTaskFilter extends StatelessWidget {
  final ComposedFilter filter;

  const TileComposedTaskFilter(this.filter, {super.key});

  @override
  build(_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.filter_list_rounded),
                const SizedBox(width: 8.0),
                Badge(
                    position: BadgePosition.topEnd(top: -5, end: -25),
                    badgeContent: Text(filter.filters.length.toString()),
                    badgeColor: Colors.white38,
                    child: Text(filter.id)),
              ],
            ),
          ],
        ),
      );
}

class List extends ConsumerWidget {
  const List({super.key});

  @override
  build(_, ref) => Text("one");
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../task.dart';
import 'comments.dart';
import 'comments.pods.dart';

/// [CommentList]
class CommentList extends ConsumerWidget {
  final Task task;

  const CommentList(this.task, {super.key});

  @override
  build(_, ref) => ref.watch(loadCommentsProvider(task.id)).maybeWhen(
      data: (data) => ListView(
            itemExtent: 35,
            children: [for (final comment in data) CommentDetail(comment)],
          ),
      orElse: () => const Icon(Icons.list));
}

class CommentDetail extends StatelessWidget {
  final Comment comment;

  const CommentDetail(this.comment, {super.key});

  @override
  build(_) => Text(comment.content);
}

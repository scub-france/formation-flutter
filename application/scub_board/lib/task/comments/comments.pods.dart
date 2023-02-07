import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'comments.dart';

// Generate a fake activity
final loadCommentsProvider = StreamProvider.autoDispose.family<List<Comment>, String>((ref, id) async* {
  final comments = <Comment>[
    Comment(id: 'C0', content: "That's a priority"),
  ];

  final timer = Timer.periodic(const Duration(milliseconds: 700), (tx) {
    print("Adding Comment");
    comments.add(Comment(id: '$tx', content: '$tx Comment for ticket $id'));
  });

  ref.onDispose(() {
    print("Dispose Timer and Stream");
    timer.cancel();
  });

  yield comments;

  // return Stream.periodic(, (idx) => comments..add(Comment(id: '$idx', content: '$idx Comment for ticket')));
});

import 'package:freezed_annotation/freezed_annotation.dart';

import '../task.dart';

part 'comments.freezed.dart';

typedef Comments = Iterable<Comment>;

@freezed
class Comment with _$Comment {
  Comment._();

  factory Comment({required Uid id, required String content}) = _Comment;
}

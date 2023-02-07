// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Task<T> {
  String get id =>
      throw _privateConstructorUsedError; // TODO(Robert): default value limitation
  String get created => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  Iterable<Label> get labels => throw _privateConstructorUsedError;
  Iterable<Task<dynamic>> get subs => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  TaskPriority get priority => throw _privateConstructorUsedError;
  Task<dynamic>? get blockedBy => throw _privateConstructorUsedError;
  Task<dynamic>? get blocking => throw _privateConstructorUsedError;
  Task<dynamic>? get duplicateOf => throw _privateConstructorUsedError;
  String get assigned => throw _privateConstructorUsedError;
  String get by => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<T, Task<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<T, $Res> {
  factory $TaskCopyWith(Task<T> value, $Res Function(Task<T>) then) =
      _$TaskCopyWithImpl<T, $Res, Task<T>>;
  @useResult
  $Res call(
      {String id,
      String created,
      String content,
      Iterable<Label> labels,
      Iterable<Task<dynamic>> subs,
      TaskStatus status,
      TaskPriority priority,
      Task<dynamic>? blockedBy,
      Task<dynamic>? blocking,
      Task<dynamic>? duplicateOf,
      String assigned,
      String by});

  $TaskCopyWith<dynamic, $Res>? get blockedBy;
  $TaskCopyWith<dynamic, $Res>? get blocking;
  $TaskCopyWith<dynamic, $Res>? get duplicateOf;
}

/// @nodoc
class _$TaskCopyWithImpl<T, $Res, $Val extends Task<T>>
    implements $TaskCopyWith<T, $Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? content = null,
    Object? labels = null,
    Object? subs = null,
    Object? status = null,
    Object? priority = null,
    Object? blockedBy = freezed,
    Object? blocking = freezed,
    Object? duplicateOf = freezed,
    Object? assigned = null,
    Object? by = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Iterable<Label>,
      subs: null == subs
          ? _value.subs
          : subs // ignore: cast_nullable_to_non_nullable
              as Iterable<Task<dynamic>>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      blockedBy: freezed == blockedBy
          ? _value.blockedBy
          : blockedBy // ignore: cast_nullable_to_non_nullable
              as Task<dynamic>?,
      blocking: freezed == blocking
          ? _value.blocking
          : blocking // ignore: cast_nullable_to_non_nullable
              as Task<dynamic>?,
      duplicateOf: freezed == duplicateOf
          ? _value.duplicateOf
          : duplicateOf // ignore: cast_nullable_to_non_nullable
              as Task<dynamic>?,
      assigned: null == assigned
          ? _value.assigned
          : assigned // ignore: cast_nullable_to_non_nullable
              as String,
      by: null == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<dynamic, $Res>? get blockedBy {
    if (_value.blockedBy == null) {
      return null;
    }

    return $TaskCopyWith<dynamic, $Res>(_value.blockedBy!, (value) {
      return _then(_value.copyWith(blockedBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<dynamic, $Res>? get blocking {
    if (_value.blocking == null) {
      return null;
    }

    return $TaskCopyWith<dynamic, $Res>(_value.blocking!, (value) {
      return _then(_value.copyWith(blocking: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<dynamic, $Res>? get duplicateOf {
    if (_value.duplicateOf == null) {
      return null;
    }

    return $TaskCopyWith<dynamic, $Res>(_value.duplicateOf!, (value) {
      return _then(_value.copyWith(duplicateOf: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<T, $Res> implements $TaskCopyWith<T, $Res> {
  factory _$$_TaskCopyWith(_$_Task<T> value, $Res Function(_$_Task<T>) then) =
      __$$_TaskCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String created,
      String content,
      Iterable<Label> labels,
      Iterable<Task<dynamic>> subs,
      TaskStatus status,
      TaskPriority priority,
      Task<dynamic>? blockedBy,
      Task<dynamic>? blocking,
      Task<dynamic>? duplicateOf,
      String assigned,
      String by});

  @override
  $TaskCopyWith<dynamic, $Res>? get blockedBy;
  @override
  $TaskCopyWith<dynamic, $Res>? get blocking;
  @override
  $TaskCopyWith<dynamic, $Res>? get duplicateOf;
}

/// @nodoc
class __$$_TaskCopyWithImpl<T, $Res>
    extends _$TaskCopyWithImpl<T, $Res, _$_Task<T>>
    implements _$$_TaskCopyWith<T, $Res> {
  __$$_TaskCopyWithImpl(_$_Task<T> _value, $Res Function(_$_Task<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? content = null,
    Object? labels = null,
    Object? subs = null,
    Object? status = null,
    Object? priority = null,
    Object? blockedBy = freezed,
    Object? blocking = freezed,
    Object? duplicateOf = freezed,
    Object? assigned = null,
    Object? by = null,
  }) {
    return _then(_$_Task<T>(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as Iterable<Label>,
      subs: null == subs
          ? _value.subs
          : subs // ignore: cast_nullable_to_non_nullable
              as Iterable<Task<dynamic>>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      blockedBy: freezed == blockedBy
          ? _value.blockedBy
          : blockedBy // ignore: cast_nullable_to_non_nullable
              as Task<dynamic>?,
      blocking: freezed == blocking
          ? _value.blocking
          : blocking // ignore: cast_nullable_to_non_nullable
              as Task<dynamic>?,
      duplicateOf: freezed == duplicateOf
          ? _value.duplicateOf
          : duplicateOf // ignore: cast_nullable_to_non_nullable
              as Task<dynamic>?,
      assigned: null == assigned
          ? _value.assigned
          : assigned // ignore: cast_nullable_to_non_nullable
              as String,
      by: null == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Task<T> extends _Task<T> {
  _$_Task(
      {required this.id,
      this.created = '20 nov',
      this.content = '',
      this.labels = const [],
      this.subs = const [],
      this.status = TaskStatus.fresh,
      this.priority = TaskPriority.noPriority,
      this.blockedBy,
      this.blocking,
      this.duplicateOf,
      this.assigned = '',
      this.by = ''})
      : super._();

  @override
  final String id;
// TODO(Robert): default value limitation
  @override
  @JsonKey()
  final String created;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final Iterable<Label> labels;
  @override
  @JsonKey()
  final Iterable<Task<dynamic>> subs;
  @override
  @JsonKey()
  final TaskStatus status;
  @override
  @JsonKey()
  final TaskPriority priority;
  @override
  final Task<dynamic>? blockedBy;
  @override
  final Task<dynamic>? blocking;
  @override
  final Task<dynamic>? duplicateOf;
  @override
  @JsonKey()
  final String assigned;
  @override
  @JsonKey()
  final String by;

  @override
  String toString() {
    return 'Task<$T>(id: $id, created: $created, content: $content, labels: $labels, subs: $subs, status: $status, priority: $priority, blockedBy: $blockedBy, blocking: $blocking, duplicateOf: $duplicateOf, assigned: $assigned, by: $by)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other.labels, labels) &&
            const DeepCollectionEquality().equals(other.subs, subs) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.blockedBy, blockedBy) ||
                other.blockedBy == blockedBy) &&
            (identical(other.blocking, blocking) ||
                other.blocking == blocking) &&
            (identical(other.duplicateOf, duplicateOf) ||
                other.duplicateOf == duplicateOf) &&
            (identical(other.assigned, assigned) ||
                other.assigned == assigned) &&
            (identical(other.by, by) || other.by == by));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      created,
      content,
      const DeepCollectionEquality().hash(labels),
      const DeepCollectionEquality().hash(subs),
      status,
      priority,
      blockedBy,
      blocking,
      duplicateOf,
      assigned,
      by);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<T, _$_Task<T>> get copyWith =>
      __$$_TaskCopyWithImpl<T, _$_Task<T>>(this, _$identity);
}

abstract class _Task<T> extends Task<T> {
  factory _Task(
      {required final String id,
      final String created,
      final String content,
      final Iterable<Label> labels,
      final Iterable<Task<dynamic>> subs,
      final TaskStatus status,
      final TaskPriority priority,
      final Task<dynamic>? blockedBy,
      final Task<dynamic>? blocking,
      final Task<dynamic>? duplicateOf,
      final String assigned,
      final String by}) = _$_Task<T>;
  _Task._() : super._();

  @override
  String get id;
  @override // TODO(Robert): default value limitation
  String get created;
  @override
  String get content;
  @override
  Iterable<Label> get labels;
  @override
  Iterable<Task<dynamic>> get subs;
  @override
  TaskStatus get status;
  @override
  TaskPriority get priority;
  @override
  Task<dynamic>? get blockedBy;
  @override
  Task<dynamic>? get blocking;
  @override
  Task<dynamic>? get duplicateOf;
  @override
  String get assigned;
  @override
  String get by;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<T, _$_Task<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

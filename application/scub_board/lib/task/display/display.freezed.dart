// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'display.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DisplayMode {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskFilter filter) filter,
    required TResult Function(Task<dynamic> task) task,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskFilter filter)? filter,
    TResult? Function(Task<dynamic> task)? task,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskFilter filter)? filter,
    TResult Function(Task<dynamic> task)? task,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilterDisplayMode value) filter,
    required TResult Function(TaskDisplayMode value) task,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterDisplayMode value)? filter,
    TResult? Function(TaskDisplayMode value)? task,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterDisplayMode value)? filter,
    TResult Function(TaskDisplayMode value)? task,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayModeCopyWith<$Res> {
  factory $DisplayModeCopyWith(
          DisplayMode value, $Res Function(DisplayMode) then) =
      _$DisplayModeCopyWithImpl<$Res, DisplayMode>;
}

/// @nodoc
class _$DisplayModeCopyWithImpl<$Res, $Val extends DisplayMode>
    implements $DisplayModeCopyWith<$Res> {
  _$DisplayModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FilterDisplayModeCopyWith<$Res> {
  factory _$$FilterDisplayModeCopyWith(
          _$FilterDisplayMode value, $Res Function(_$FilterDisplayMode) then) =
      __$$FilterDisplayModeCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskFilter filter});
}

/// @nodoc
class __$$FilterDisplayModeCopyWithImpl<$Res>
    extends _$DisplayModeCopyWithImpl<$Res, _$FilterDisplayMode>
    implements _$$FilterDisplayModeCopyWith<$Res> {
  __$$FilterDisplayModeCopyWithImpl(
      _$FilterDisplayMode _value, $Res Function(_$FilterDisplayMode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$FilterDisplayMode(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as TaskFilter,
    ));
  }
}

/// @nodoc

class _$FilterDisplayMode implements FilterDisplayMode {
  const _$FilterDisplayMode({this.filter = const NoOpFilter()});

  @override
  @JsonKey()
  final TaskFilter filter;

  @override
  String toString() {
    return 'DisplayMode.filter(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterDisplayMode &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterDisplayModeCopyWith<_$FilterDisplayMode> get copyWith =>
      __$$FilterDisplayModeCopyWithImpl<_$FilterDisplayMode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskFilter filter) filter,
    required TResult Function(Task<dynamic> task) task,
  }) {
    return filter(this.filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskFilter filter)? filter,
    TResult? Function(Task<dynamic> task)? task,
  }) {
    return filter?.call(this.filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskFilter filter)? filter,
    TResult Function(Task<dynamic> task)? task,
    required TResult orElse(),
  }) {
    if (filter != null) {
      return filter(this.filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilterDisplayMode value) filter,
    required TResult Function(TaskDisplayMode value) task,
  }) {
    return filter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterDisplayMode value)? filter,
    TResult? Function(TaskDisplayMode value)? task,
  }) {
    return filter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterDisplayMode value)? filter,
    TResult Function(TaskDisplayMode value)? task,
    required TResult orElse(),
  }) {
    if (filter != null) {
      return filter(this);
    }
    return orElse();
  }
}

abstract class FilterDisplayMode implements DisplayMode {
  const factory FilterDisplayMode({final TaskFilter filter}) =
      _$FilterDisplayMode;

  TaskFilter get filter;
  @JsonKey(ignore: true)
  _$$FilterDisplayModeCopyWith<_$FilterDisplayMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskDisplayModeCopyWith<$Res> {
  factory _$$TaskDisplayModeCopyWith(
          _$TaskDisplayMode value, $Res Function(_$TaskDisplayMode) then) =
      __$$TaskDisplayModeCopyWithImpl<$Res>;
  @useResult
  $Res call({Task<dynamic> task});

  $TaskCopyWith<dynamic, $Res> get task;
}

/// @nodoc
class __$$TaskDisplayModeCopyWithImpl<$Res>
    extends _$DisplayModeCopyWithImpl<$Res, _$TaskDisplayMode>
    implements _$$TaskDisplayModeCopyWith<$Res> {
  __$$TaskDisplayModeCopyWithImpl(
      _$TaskDisplayMode _value, $Res Function(_$TaskDisplayMode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$TaskDisplayMode(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task<dynamic>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<dynamic, $Res> get task {
    return $TaskCopyWith<dynamic, $Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$TaskDisplayMode implements TaskDisplayMode {
  const _$TaskDisplayMode(this.task);

  @override
  final Task<dynamic> task;

  @override
  String toString() {
    return 'DisplayMode.task(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDisplayMode &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDisplayModeCopyWith<_$TaskDisplayMode> get copyWith =>
      __$$TaskDisplayModeCopyWithImpl<_$TaskDisplayMode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskFilter filter) filter,
    required TResult Function(Task<dynamic> task) task,
  }) {
    return task(this.task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskFilter filter)? filter,
    TResult? Function(Task<dynamic> task)? task,
  }) {
    return task?.call(this.task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskFilter filter)? filter,
    TResult Function(Task<dynamic> task)? task,
    required TResult orElse(),
  }) {
    if (task != null) {
      return task(this.task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilterDisplayMode value) filter,
    required TResult Function(TaskDisplayMode value) task,
  }) {
    return task(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterDisplayMode value)? filter,
    TResult? Function(TaskDisplayMode value)? task,
  }) {
    return task?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterDisplayMode value)? filter,
    TResult Function(TaskDisplayMode value)? task,
    required TResult orElse(),
  }) {
    if (task != null) {
      return task(this);
    }
    return orElse();
  }
}

abstract class TaskDisplayMode implements DisplayMode {
  const factory TaskDisplayMode(final Task<dynamic> task) = _$TaskDisplayMode;

  Task<dynamic> get task;
  @JsonKey(ignore: true)
  _$$TaskDisplayModeCopyWith<_$TaskDisplayMode> get copyWith =>
      throw _privateConstructorUsedError;
}

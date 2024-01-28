// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuotesModel _$QuotesModelFromJson(Map<String, dynamic> json) {
  return _QuotesModel.fromJson(json);
}

/// @nodoc
mixin _$QuotesModel {
  String get content => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuotesModelCopyWith<QuotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotesModelCopyWith<$Res> {
  factory $QuotesModelCopyWith(
          QuotesModel value, $Res Function(QuotesModel) then) =
      _$QuotesModelCopyWithImpl<$Res, QuotesModel>;
  @useResult
  $Res call({String content, String author, List<String> tags});
}

/// @nodoc
class _$QuotesModelCopyWithImpl<$Res, $Val extends QuotesModel>
    implements $QuotesModelCopyWith<$Res> {
  _$QuotesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? author = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuotesModelImplCopyWith<$Res>
    implements $QuotesModelCopyWith<$Res> {
  factory _$$QuotesModelImplCopyWith(
          _$QuotesModelImpl value, $Res Function(_$QuotesModelImpl) then) =
      __$$QuotesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, String author, List<String> tags});
}

/// @nodoc
class __$$QuotesModelImplCopyWithImpl<$Res>
    extends _$QuotesModelCopyWithImpl<$Res, _$QuotesModelImpl>
    implements _$$QuotesModelImplCopyWith<$Res> {
  __$$QuotesModelImplCopyWithImpl(
      _$QuotesModelImpl _value, $Res Function(_$QuotesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? author = null,
    Object? tags = null,
  }) {
    return _then(_$QuotesModelImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuotesModelImpl extends _QuotesModel {
  const _$QuotesModelImpl(
      {required this.content,
      required this.author,
      required final List<String> tags})
      : _tags = tags,
        super._();

  factory _$QuotesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuotesModelImplFromJson(json);

  @override
  final String content;
  @override
  final String author;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'QuotesModel(content: $content, author: $author, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuotesModelImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.author, author) || other.author == author) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, content, author, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuotesModelImplCopyWith<_$QuotesModelImpl> get copyWith =>
      __$$QuotesModelImplCopyWithImpl<_$QuotesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuotesModelImplToJson(
      this,
    );
  }
}

abstract class _QuotesModel extends QuotesModel {
  const factory _QuotesModel(
      {required final String content,
      required final String author,
      required final List<String> tags}) = _$QuotesModelImpl;
  const _QuotesModel._() : super._();

  factory _QuotesModel.fromJson(Map<String, dynamic> json) =
      _$QuotesModelImpl.fromJson;

  @override
  String get content;
  @override
  String get author;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$QuotesModelImplCopyWith<_$QuotesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

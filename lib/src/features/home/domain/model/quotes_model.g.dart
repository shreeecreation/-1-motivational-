// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuotesModelImpl _$$QuotesModelImplFromJson(Map<String, dynamic> json) =>
    _$QuotesModelImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      author: json['author'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$QuotesModelImplToJson(_$QuotesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'author': instance.author,
      'tags': instance.tags,
    };

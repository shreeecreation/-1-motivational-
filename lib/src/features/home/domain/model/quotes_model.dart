import 'package:freezed_annotation/freezed_annotation.dart';
part 'quotes_model.freezed.dart';
part 'quotes_model.g.dart';

@freezed
class QuotesModel with _$QuotesModel {
  const QuotesModel._();

  const factory QuotesModel({
    // required String id,
    required String content,
    required String author,
    @Default([]) List<String> tags,
  }) = _QuotesModel;

  factory QuotesModel.fromJson(Map<String, dynamic> json) =>
      _$QuotesModelFromJson(json);
}

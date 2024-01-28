import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motivational/src/features/home/domain/model/quotes_model.dart';

part 'get_random_quotes_state.dart';
part 'get_random_quotes_cubit.freezed.dart';


class GetRandomQuotesCubit extends Cubit<GetRandomQuotesState> {
	GetRandomQuotesCubit() : super(GetRandomQuotesState.initial());
	

}

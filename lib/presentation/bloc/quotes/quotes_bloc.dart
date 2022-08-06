import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar_flutter/domain/model/quotes_domain.dart';
import 'package:isar_flutter/domain/usecase/get_quotes_usecase.dart';
import 'package:isar_flutter/domain/usecase/save_quotes_usecase.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final GetQuotesUsecase getQuotesUsecase;
  final SaveQuotesUsecase saveQuotesUsecase;

  QuotesBloc({
    required this.getQuotesUsecase,
    required this.saveQuotesUsecase,
  }) : super(const QuotesState.initial()) {
    on<QuotesEventIntial>((event, emit) async {
      final result = await getQuotesUsecase.execute();

      result.fold(
        (error) => null,
        (result) {
          emit(state.copyWith(quote: result));
        },
      );
    });

    on<QuoteEventSave>((event, emit) async {
      final result = await saveQuotesUsecase.execute(
        text: event.text,
        author: event.author,
      );

      result.fold(
        (error) => print(error),
        (result) {
          emit(state.copyWith(saveIsSuccess: true));
          emit(state.copyWith(saveIsSuccess: false));
        },
      );
    });
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar_flutter/domain/model/quotes_domain.dart';
import 'package:isar_flutter/domain/usecase/get_quotes_usecase.dart';
import 'package:isar_flutter/domain/usecase/internet_connectivity_usecase.dart';
import 'package:isar_flutter/domain/usecase/save_quotes_usecase.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final GetQuotesUsecase getQuotesUsecase;
  final SaveQuotesUsecase saveQuotesUsecase;
  final InternetConnectivityUsecase internetConnectivityUsecase;

  QuotesBloc({
    required this.getQuotesUsecase,
    required this.saveQuotesUsecase,
    required this.internetConnectivityUsecase,
  }) : super(const QuotesState.initial()) {
    on<QuotesEventIntial>((event, emit) async {
      final result = await getQuotesUsecase.execute();

      add(QuoteEventInternetCheck());

      result.fold(
        (error) => print(error),
        (result) {
          emit(state.copyWith(quote: result));
        },
      );
    });

    on<QuoteEventInputLabel>((event, emit) {
      emit(state.copyWith(label: event.label));
    });

    on<QuoteEventSave>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final result = await saveQuotesUsecase.execute(
        text: event.text,
        author: event.author,
        label: state.label,
      );

      result.fold(
        (error) {
          print(error);
          emit(state.copyWith(isLoading: false));
        },
        (result) {
          emit(state.copyWith(saveIsSuccess: true, isLoading: false));
          emit(state.copyWith(saveIsSuccess: false));
        },
      );
    });

    on<QuoteEventInternetCheck>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      await emit.forEach(
        internetConnectivityUsecase.execute(),
        onData: (msg) {
          bool isConnect = (msg == true);
          return state.copyWith(
            isConnect: isConnect,
            isLoading: false,
          );
        },
      );
    });
  }
}

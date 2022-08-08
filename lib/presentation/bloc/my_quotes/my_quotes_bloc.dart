import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar_flutter/domain/model/quotes_with_label_domain.dart';
import 'package:isar_flutter/domain/usecase/deleted_quotes_usecase.dart';
import 'package:isar_flutter/domain/usecase/get_save_quotes_usecase.dart';

part 'my_quotes_event.dart';
part 'my_quotes_state.dart';

class MyQuotesBloc extends Bloc<MyQuotesEvent, MyQuotesState> {
  final GetSaveQuotesUsecase getSaveQuotesUsecase;
  final DeletedQuotesUsecase deletedQuotesUsecase;

  MyQuotesBloc({
    required this.getSaveQuotesUsecase,
    required this.deletedQuotesUsecase,
  }) : super(MyQuotesState.intial()) {
    on<MyQuotesEventInitial>((event, emit) async {
      final limit = event.forceRefresh ? state.limit : state.limit + 5;

      final result = await getSaveQuotesUsecase.execute(limit: limit);

      result.fold(
        (error) => print(error),
        (result) {
          print(result);
          emit(
            state.copyWith(
              quotes: result,
              limit: limit,
            ),
          );
        },
      );
    });

    on<MyQuotesEventDeleted>((event, emit) async {
      final result = await deletedQuotesUsecase.execute(id: event.id);

      result.fold(
        (error) => print(error),
        (result) {
          add(MyQuotesEventInitial(forceRefresh: true));
        },
      );
    });
  }
}

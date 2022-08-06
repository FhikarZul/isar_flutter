import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar_flutter/domain/model/quotes_domain.dart';
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
      final result = await getSaveQuotesUsecase.execute();

      result.fold(
        (error) => print(error),
        (result) => emit(state.copyWith(quotes: result)),
      );
    });

    on<MyQuotesEventDeleted>((event, emit) async {
      final result = await deletedQuotesUsecase.execute(id: event.id);

      result.fold(
        (error) => print(error),
        (result) {
          add(MyQuotesEventInitial());
        },
      );
    });
  }
}

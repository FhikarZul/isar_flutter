part of 'my_quotes_bloc.dart';

abstract class MyQuotesEvent extends Equatable {}

class MyQuotesEventInitial extends MyQuotesEvent {
  final bool forceRefresh;

  MyQuotesEventInitial({required this.forceRefresh});

  @override
  List<Object?> get props => [forceRefresh];
}

class MyQuotesEventDeleted extends MyQuotesEvent {
  final int id;

  MyQuotesEventDeleted({required this.id});

  @override
  List<Object?> get props => [id];
}

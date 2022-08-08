part of 'my_quotes_bloc.dart';

class MyQuotesState extends Equatable {
  final List<QuotesWithLabelDomain> quotes;
  final int limit;

  const MyQuotesState({
    required this.quotes,
    required this.limit,
  });

  MyQuotesState.intial()
      : quotes = [],
        limit = 8;

  MyQuotesState copyWith({
    List<QuotesWithLabelDomain>? quotes,
    int? limit,
  }) =>
      MyQuotesState(
        quotes: quotes ?? this.quotes,
        limit: limit ?? this.limit,
      );

  @override
  List<Object> get props => [quotes, limit];
}

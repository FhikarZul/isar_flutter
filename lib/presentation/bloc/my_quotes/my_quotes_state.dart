part of 'my_quotes_bloc.dart';

class MyQuotesState extends Equatable {
  final List<QuotesDomain> quotes;

  const MyQuotesState({required this.quotes});

  MyQuotesState.intial() : quotes = [];

  MyQuotesState copyWith({List<QuotesDomain>? quotes}) => MyQuotesState(
        quotes: quotes ?? this.quotes,
      );

  @override
  List<Object> get props => [quotes];
}

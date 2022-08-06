part of 'quotes_bloc.dart';

class QuotesState extends Equatable {
  final bool isLoading;
  final QuotesDomain quote;
  final bool saveIsSuccess;

  const QuotesState({
    required this.isLoading,
    required this.quote,
    required this.saveIsSuccess,
  });

  const QuotesState.initial()
      : quote = const QuotesDomain(text: '', author: ''),
        isLoading = false,
        saveIsSuccess = false;

  QuotesState copyWith({
    bool? isLoading,
    QuotesDomain? quote,
    bool? saveIsSuccess,
  }) =>
      QuotesState(
        isLoading: isLoading ?? this.isLoading,
        quote: quote ?? this.quote,
        saveIsSuccess: saveIsSuccess ?? this.saveIsSuccess,
      );

  @override
  List<Object> get props => [isLoading, quote, saveIsSuccess];
}

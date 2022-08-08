part of 'quotes_bloc.dart';

class QuotesState extends Equatable {
  final bool isLoading;
  final bool isError;
  final QuotesDomain quote;
  final bool saveIsSuccess;

  const QuotesState({
    required this.isLoading,
    required this.isError,
    required this.quote,
    required this.saveIsSuccess,
  });

  const QuotesState.initial()
      : quote = const QuotesDomain(text: '', author: ''),
        isLoading = false,
        isError = false,
        saveIsSuccess = false;

  QuotesState copyWith({
    bool? isLoading,
    bool? isError,
    QuotesDomain? quote,
    bool? saveIsSuccess,
  }) =>
      QuotesState(
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        quote: quote ?? this.quote,
        saveIsSuccess: saveIsSuccess ?? this.saveIsSuccess,
      );

  @override
  List<Object> get props => [isLoading, quote, saveIsSuccess, isError];
}

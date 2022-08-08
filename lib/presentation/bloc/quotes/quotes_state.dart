part of 'quotes_bloc.dart';

class QuotesState extends Equatable {
  final bool isLoading;
  final bool isConnect;
  final QuotesDomain quote;
  final bool saveIsSuccess;
  final String label;

  const QuotesState({
    required this.isLoading,
    required this.isConnect,
    required this.quote,
    required this.saveIsSuccess,
    required this.label,
  });

  const QuotesState.initial()
      : quote = const QuotesDomain(text: '', author: ''),
        isLoading = false,
        isConnect = true,
        label = '',
        saveIsSuccess = false;

  QuotesState copyWith({
    bool? isLoading,
    bool? isConnect,
    String? label,
    QuotesDomain? quote,
    bool? saveIsSuccess,
  }) =>
      QuotesState(
        isLoading: isLoading ?? this.isLoading,
        isConnect: isConnect ?? this.isConnect,
        quote: quote ?? this.quote,
        label: label ?? this.label,
        saveIsSuccess: saveIsSuccess ?? this.saveIsSuccess,
      );

  @override
  List<Object> get props => [
        isLoading,
        quote,
        saveIsSuccess,
        isConnect,
        label,
      ];
}

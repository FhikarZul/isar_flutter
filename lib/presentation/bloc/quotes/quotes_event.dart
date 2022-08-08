part of 'quotes_bloc.dart';

abstract class QuotesEvent extends Equatable {}

class QuotesEventIntial extends QuotesEvent {
  @override
  List<Object?> get props => [];
}

class QuoteEventSave extends QuotesEvent {
  final String text;
  final String author;

  QuoteEventSave({required this.text, required this.author});

  @override
  List<Object?> get props => [text, author];
}

class QuoteEventInternetCheck extends QuotesEvent {
  @override
  List<Object?> get props => [];
}

class QuoteEventInputLabel extends QuotesEvent {
  final String label;

  QuoteEventInputLabel({required this.label});

  @override
  List<Object?> get props => [label];
}

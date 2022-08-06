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

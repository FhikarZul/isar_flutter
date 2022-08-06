import 'package:equatable/equatable.dart';

class QuotesDomain extends Equatable {
  final int? id;
  final String? uuid;
  final String text;
  final String author;

  const QuotesDomain({
    this.id,
    this.uuid,
    required this.text,
    required this.author,
  });

  @override
  List<Object?> get props => [uuid, text, author, id];
}

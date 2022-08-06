import 'package:equatable/equatable.dart';
import 'package:isar_flutter/domain/model/quotes_domain.dart';

class QuotesModel extends Equatable {
  final int? id;
  final String? uuid;
  final String text;
  final String? author;

  const QuotesModel({this.id, this.uuid, required this.text, this.author});

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        text: json['text'],
        author: json['author'] ?? 'Anonim',
      );

  QuotesDomain toDomain() => QuotesDomain(
        id: id,
        text: text,
        author: author ?? 'Anonim',
      );

  @override
  List<Object?> get props => [text, author, uuid, id];
}

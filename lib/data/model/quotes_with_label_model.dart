import 'package:equatable/equatable.dart';
import 'package:isar_flutter/domain/model/label_domain.dart';
import 'package:isar_flutter/domain/model/quotes_with_label_domain.dart';

import 'label_model.dart';

class QuotesWithLabelModel extends Equatable {
  final int? id;
  final String? uuid;
  final String text;
  final String? author;
  final LabelModel label;

  const QuotesWithLabelModel({
    required this.id,
    required this.uuid,
    required this.text,
    required this.author,
    required this.label,
  });

  QuotesWithLabelDomain toDomain() => QuotesWithLabelDomain(
      id: id,
      uuid: uuid,
      text: text,
      author: author,
      label: LabelDomain(
        id: label.id,
        uuid: label.uuid,
        name: label.name,
      ));

  @override
  List<Object?> get props => [
        id,
        uuid,
        text,
        author,
        label,
      ];
}

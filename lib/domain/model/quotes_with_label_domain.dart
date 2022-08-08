import 'package:equatable/equatable.dart';

import 'label_domain.dart';

class QuotesWithLabelDomain extends Equatable {
  final int? id;
  final String? uuid;
  final String text;
  final String? author;
  final LabelDomain label;

  const QuotesWithLabelDomain({
    required this.id,
    required this.uuid,
    required this.text,
    required this.author,
    required this.label,
  });

  @override
  List<Object?> get props => [
        id,
        uuid,
        text,
        author,
        label,
      ];
}

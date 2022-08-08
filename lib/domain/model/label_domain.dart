import 'package:equatable/equatable.dart';

class LabelDomain extends Equatable {
  final int? id;
  final String? uuid;
  final String? name;

  const LabelDomain({
    required this.id,
    required this.uuid,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name, uuid];
}

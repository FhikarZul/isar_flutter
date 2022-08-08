import 'package:equatable/equatable.dart';

class LabelModel extends Equatable {
  final int? id;
  final String? uuid;
  final String? name;

  const LabelModel({
    required this.id,
    required this.uuid,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name, uuid];
}

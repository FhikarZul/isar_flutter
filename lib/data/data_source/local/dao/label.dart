import 'package:isar/isar.dart';

part 'label.g.dart';

@Collection()
class Label {
  @Id()
  int? id;

  @Index(unique: true)
  late String uuid;

  late String name;
}

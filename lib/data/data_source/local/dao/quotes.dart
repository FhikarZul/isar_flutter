import 'package:isar/isar.dart';
import 'package:isar_flutter/data/data_source/local/dao/label.dart';

part 'quotes.g.dart';

@Collection()
class Quotes {
  @Id()
  int? id;

  @Index(unique: true)
  late String uuid;

  late String text;
  late String author;
  final label = IsarLink<Label>();
}

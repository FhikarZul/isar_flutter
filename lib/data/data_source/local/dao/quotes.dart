import 'package:isar/isar.dart';

part 'quotes.g.dart';

@Collection()
class Quotes {
  @Id()
  int? id;
  late String uuid;
  late String text;
  late String author;
}

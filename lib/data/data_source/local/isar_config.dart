import 'package:isar/isar.dart';
import 'package:isar_flutter/data/data_source/local/dao/label.dart';
import 'package:isar_flutter/data/data_source/local/dao/quotes.dart';
import 'package:path_provider/path_provider.dart';

class IsarConfig {
  Future<Isar> isarInstance() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      schemas: [QuotesSchema, LabelSchema],
      directory: dir.path,
    );

    return isar;
  }
}

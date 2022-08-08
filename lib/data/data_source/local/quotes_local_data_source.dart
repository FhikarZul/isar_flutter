import 'package:isar/isar.dart';
import 'package:isar_flutter/data/data_source/local/dao/label.dart';
import 'package:isar_flutter/data/data_source/local/dao/quotes.dart';
import 'package:isar_flutter/data/data_source/local/isar_config.dart';
import 'package:isar_flutter/data/model/label_model.dart';
import 'package:isar_flutter/data/model/quotes_with_label_model.dart';
import 'package:uuid/uuid.dart';

abstract class IQuotesLocalDataSource {
  Future<void> insertQuotes({
    required String text,
    required String author,
    required String label,
  });
  Future<List<QuotesWithLabelModel>> getQuotes({required int limit});
  Future<void> deletedQuotes({required int id});
}

class QuotesLocalDataSource extends IQuotesLocalDataSource {
  final IsarConfig isarConfig;

  QuotesLocalDataSource({required this.isarConfig});

  @override
  Future<List<QuotesWithLabelModel>> getQuotes({required int limit}) async {
    final isar = await isarConfig.isarInstance();

    try {
      final quotes = await isar.quotess.where().limit(limit).findAll();

      for (final quote in quotes) {
        if (quote.label.isLoaded) continue;
        await quote.label.load();
      }

      final listQuote = quotes
          .map((e) => QuotesWithLabelModel(
              id: e.id,
              uuid: e.uuid,
              text: e.text,
              author: e.author,
              label: LabelModel(
                id: e.label.value?.id,
                uuid: e.label.value?.uuid,
                name: e.label.value?.name,
              )))
          .toList();

      isar.close();
      return listQuote;
    } catch (e) {
      isar.close();

      throw Exception(e);
    }
  }

  @override
  Future<void> insertQuotes({
    required String text,
    required String author,
    required String label,
  }) async {
    try {
      final isar = await isarConfig.isarInstance();

      final labels = Label()
        ..id = Isar.autoIncrement
        ..uuid = const Uuid().v4()
        ..name = label;

      final quotes = Quotes()
        ..id = Isar.autoIncrement
        ..uuid = const Uuid().v4()
        ..text = text
        ..author = author
        ..label.value = labels;

      await isar.writeTxn((isar) async {
        await isar.labels.put(labels, replaceOnConflict: true);
        await isar.quotess.put(
          quotes,
          replaceOnConflict: true,
          saveLinks: true,
        );
      });

      isar.close();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deletedQuotes({required int id}) async {
    try {
      final isar = await isarConfig.isarInstance();

      final quotes = isar.quotess;

      await isar.writeTxn((isar) => quotes.delete(id));

      isar.close();
    } catch (e) {
      throw Exception(e);
    }
  }
}

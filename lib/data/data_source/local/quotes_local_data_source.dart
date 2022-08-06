import 'package:isar/isar.dart';
import 'package:isar_flutter/data/data_source/local/dao/quotes.dart';
import 'package:isar_flutter/data/data_source/local/isar_config.dart';
import 'package:isar_flutter/data/model/quotes_model.dart';
import 'package:uuid/uuid.dart';

abstract class IQuotesLocalDataSource {
  Future<void> insertQuotes({required String text, required String author});
  Future<List<QuotesModel>> getQuotes();
  Future<void> deletedQuotes({required int id});
}

class QuotesLocalDataSource extends IQuotesLocalDataSource {
  final IsarConfig isarConfig;

  QuotesLocalDataSource({required this.isarConfig});

  @override
  Future<List<QuotesModel>> getQuotes() async {
    try {
      final isar = await isarConfig.isarInstance();

      final quotes = isar.quotess;

      final data = await quotes.where().findAll();

      var listQuote = data.map((e) {
        return QuotesModel(
          id: e.id,
          uuid: e.uuid,
          text: e.text,
          author: e.author,
        );
      }).toList();

      isar.close();

      return listQuote;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> insertQuotes({
    required String text,
    required String author,
  }) async {
    try {
      final isar = await isarConfig.isarInstance();

      final quotes = Quotes()
        ..id = Isar.autoIncrement
        ..uuid = const Uuid().v4()
        ..text = text
        ..author = author;

      await isar.writeTxn((isar) async {
        quotes.id = await isar.quotess.put(quotes);
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

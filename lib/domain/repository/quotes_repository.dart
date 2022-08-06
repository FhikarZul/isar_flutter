import 'package:dartz/dartz.dart';
import 'package:isar_flutter/domain/model/quotes_domain.dart';

abstract class IQuotesRepository {
  Future<Either<Exception, QuotesDomain>> getQuotes();
  Future<Either<Exception, List<QuotesDomain>>> getSaveQuote();
  Future<Either<Exception, bool>> saveQuote({
    required String text,
    required String author,
  });
  Future<Either<Exception, bool>> deletedQuotes({required int id});
}

import 'package:dartz/dartz.dart';
import 'package:isar_flutter/domain/model/quotes_domain.dart';
import 'package:isar_flutter/domain/model/quotes_with_label_domain.dart';

abstract class IQuotesRepository {
  Future<Either<Exception, QuotesDomain>> getQuotes();
  Future<Either<Exception, List<QuotesWithLabelDomain>>> getSaveQuote({
    required int limit,
  });
  Future<Either<Exception, bool>> saveQuote({
    required String text,
    required String author,
    required String label,
  });
  Future<Either<Exception, bool>> deletedQuotes({required int id});
}

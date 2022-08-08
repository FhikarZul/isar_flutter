import 'package:dartz/dartz.dart';
import 'package:isar_flutter/domain/model/quotes_with_label_domain.dart';
import 'package:isar_flutter/domain/repository/quotes_repository.dart';

class GetSaveQuotesUsecase {
  final IQuotesRepository repository;

  GetSaveQuotesUsecase({required this.repository});

  Future<Either<Exception, List<QuotesWithLabelDomain>>> execute(
          {required int limit}) =>
      repository.getSaveQuote(limit: limit);
}

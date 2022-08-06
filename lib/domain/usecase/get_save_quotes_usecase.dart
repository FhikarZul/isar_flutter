import 'package:dartz/dartz.dart';
import 'package:isar_flutter/domain/model/quotes_domain.dart';
import 'package:isar_flutter/domain/repository/quotes_repository.dart';

class GetSaveQuotesUsecase {
  final IQuotesRepository repository;

  GetSaveQuotesUsecase({required this.repository});

  Future<Either<Exception, List<QuotesDomain>>> execute() =>
      repository.getSaveQuote();
}

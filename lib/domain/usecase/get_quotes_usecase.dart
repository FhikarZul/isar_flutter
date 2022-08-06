import 'package:dartz/dartz.dart';
import 'package:isar_flutter/domain/model/quotes_domain.dart';
import 'package:isar_flutter/domain/repository/quotes_repository.dart';

class GetQuotesUsecase {
  final IQuotesRepository repository;

  GetQuotesUsecase({required this.repository});

  Future<Either<Exception, QuotesDomain>> execute() => repository.getQuotes();
}

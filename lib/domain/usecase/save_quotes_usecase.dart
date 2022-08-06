import 'package:dartz/dartz.dart';
import 'package:isar_flutter/domain/repository/quotes_repository.dart';

class SaveQuotesUsecase {
  final IQuotesRepository repository;

  SaveQuotesUsecase({required this.repository});

  Future<Either<Exception, bool>> execute({
    required String text,
    required String author,
  }) =>
      repository.saveQuote(
        text: text,
        author: author,
      );
}

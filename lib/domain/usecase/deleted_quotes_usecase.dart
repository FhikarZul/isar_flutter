import 'package:dartz/dartz.dart';
import 'package:isar_flutter/domain/repository/quotes_repository.dart';

class DeletedQuotesUsecase {
  final IQuotesRepository repository;

  DeletedQuotesUsecase({required this.repository});

  Future<Either<Exception, bool>> execute({required int id}) =>
      repository.deletedQuotes(id: id);
}

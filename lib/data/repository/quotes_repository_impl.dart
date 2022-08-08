import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:isar_flutter/data/data_source/local/quotes_local_data_source.dart';
import 'package:isar_flutter/data/data_source/remote/quotes_remote_data_source.dart';
import 'package:isar_flutter/domain/model/quotes_domain.dart';
import 'package:isar_flutter/domain/model/quotes_with_label_domain.dart';
import 'package:isar_flutter/domain/repository/quotes_repository.dart';

class QuotesRepositoryImpl extends IQuotesRepository {
  final IQuotesRemoteDataSource remoteDataSource;
  final IQuotesLocalDataSource localDataSource;

  QuotesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Exception, QuotesDomain>> getQuotes() async {
    try {
      final result = await remoteDataSource.getQuotes();

      int length = result.length;

      QuotesDomain quote = result.map((e) => e.toDomain()).elementAt(
            Random().nextInt(length),
          );

      return Right(quote);
    } on SocketException {
      return Left(Exception('get quotes repository is error'));
    } catch (e) {
      return Left(Exception('get quotes repository is error [$e]'));
    }
  }

  @override
  Future<Either<Exception, List<QuotesWithLabelDomain>>> getSaveQuote(
      {required int limit}) async {
    try {
      final result = await localDataSource.getQuotes(limit: limit);

      return Right(result.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, bool>> saveQuote({
    required String text,
    required String author,
    required String label,
  }) async {
    try {
      await localDataSource.insertQuotes(
        text: text,
        author: author,
        label: label,
      );

      return const Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, bool>> deletedQuotes({required int id}) async {
    try {
      await localDataSource.deletedQuotes(id: id);

      return const Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}

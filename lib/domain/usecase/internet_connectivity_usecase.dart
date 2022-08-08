import 'package:isar_flutter/domain/repository/internet_connection_repository.dart';

class InternetConnectivityUsecase {
  final IInternetConnectionRepository repository;

  InternetConnectivityUsecase({required this.repository});

  Stream<bool> execute() => repository.internetConnectivity();
}

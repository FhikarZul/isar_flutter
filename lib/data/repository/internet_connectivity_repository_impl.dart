import 'dart:io';

import 'package:isar_flutter/domain/repository/internet_connection_repository.dart';

class InternetConnectionRepositoryImpl extends IInternetConnectionRepository {
  @override
  Stream<bool> internetConnectivity() async* {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        yield true;

        return;
      }
    } on SocketDirection {
      yield false;
    } catch (_) {
      yield false;
    }
    yield false;
  }
}

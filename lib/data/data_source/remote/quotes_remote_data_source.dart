import 'dart:convert';

import 'package:http/http.dart';
import 'package:isar_flutter/data/data_source/remote/api_config.dart';
import 'package:isar_flutter/data/model/quotes_model.dart';

abstract class IQuotesRemoteDataSource {
  Future<List<QuotesModel>> getQuotes();
}

class QuotesRemoteDataSource extends IQuotesRemoteDataSource {
  final Client httpClient;

  QuotesRemoteDataSource({required this.httpClient});

  @override
  Future<List<QuotesModel>> getQuotes() async {
    const url = '${ApiConfig.baseUrl}/api/quotes';

    final response = await httpClient.get(
      Uri.parse(url),
    );

    try {
      if (response.statusCode == 200) {
        return List<QuotesModel>.from(
          jsonDecode(response.body).map(
            (e) => QuotesModel.fromJson(e),
          ),
        ).toList();
      } else {
        throw Exception('get quotes remote not is 200');
      }
    } catch (e) {
      throw Exception('get quotes remote is time out [$e]');
    }
  }
}

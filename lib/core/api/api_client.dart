import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://cms.test/api/v1',
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  ),
);

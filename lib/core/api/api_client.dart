import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://plgj4xmyfr.sharedwithexpose.com/api/v1',
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  ),
);

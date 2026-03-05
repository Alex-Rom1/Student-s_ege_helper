import 'package:example/data/repository/repository.dart';
import 'package:dio/dio.dart';

class Client implements Repository{
  String? _authToken;

  final Dio _dio;

  Client({required Dio dio}) : _dio = dio;

  @override
  String? get authToken => _authToken;
}
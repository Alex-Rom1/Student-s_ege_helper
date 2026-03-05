import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:students_ege_helper/data/repository/client.dart';

class AiUseCase {
  final Client _client;
  final _connectivity = Connectivity();

  AiUseCase({required Dio dio}) : _client = Client(dio: dio);

  String? get authToken => _client.authToken;

  Future<void> request<T>({
    required Future<T> Function() request,
    required Function(T) onResponse,
    required Function(String) onError,
  }) async {
    final connectivityResults = await _connectivity.checkConnectivity();

    if (connectivityResults.contains(ConnectivityResult.none)) {
      await onError('Нет подключения к интернету');
    } else {
      try {
        T response = await request();
        await onResponse(response);
      } on Exception catch (e) {
        await onError(castError(e));
      }
    }
  }

  String castError(Exception e) {
    if (e is! DioException) {
      return e.toString();
    }

    if (e.response == null) {
      return e.toString();
    }

    return '${e.response!.statusMessage} (${e.response!.statusCode})\n${e.message}';
  }

  Future<void> tokenLogin({
    required String token,
    required Function(void) onResponse,
    required Function(String) onError,
  }) async {
    await request(
      request: () => _client.tokenLogin(token: token),
      onResponse: onResponse,
      onError: onError,
    );
  }
}

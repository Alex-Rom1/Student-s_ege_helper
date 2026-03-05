import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:students_ege_helper/domain/use_cases/ai_use_case.dart';

class ExtendedAiUseCase extends AiUseCase {
  final Connectivity _connectivity = .new();

  ExtendedAiUseCase({required super.dio});

  @override
  Future<void> request<T>({
    required Future<T> Function() request,
    required Function(T) onResponse,
    required Function(String) onError,
  }) async {
    final connectivityResults = await _connectivity.checkConnectivity();

    if (connectivityResults.contains(ConnectivityResult.none)) {
      await onError('Нет подключения к интернету');
    } else {
      return await super.request(
        request: request,
        onResponse: onResponse,
        onError: onError,
      );
    }
  }
}

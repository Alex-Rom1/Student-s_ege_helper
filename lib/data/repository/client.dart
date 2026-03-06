import 'package:students_ege_helper/data/repository/repository.dart';
import 'package:dio/dio.dart';

class Client implements Repository {
  String? _authToken;

  final Dio _dio;

  Client({required Dio dio}) : _dio = dio;

  @override
  String? get authToken => _authToken;

  String get _completionsUrl => '/chat/completions';

  @override
  Future<void> tokenLogin({required String token}) async {
    _authToken = token;
  }

  @override
  Future<String> getCompletion({required String prompt}) async {
    var response = await _dio.post(
      _completionsUrl,
      options: Options(
        headers: {
          'Authorization': 'Bearer $_authToken',
          'Content-Type': 'application/json',
        },
      ),
      data: {
        'model': 'openrouter/free',
        'messages': [
          {
            'role': 'user',
            'content':
                'Отвечай только на вопросы по учебе в школе и всероссийским государственным экзаменам: $prompt',
          },
        ],
      },
    );
    return response.data['choices'][0]['message']['content'];
  }
}

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:students_ege_helper/domain/use_cases/ai_use_case.dart';

final AiUseCase _aiUseCase = .new(
  dio: .new(.new(baseUrl: 'https://openrouter.ai/api/v1')),
);

void onResponse<ExpectedT>(obj) {
  stdout.writeln(obj.toString());

  expect(obj, isInstanceOf<ExpectedT>());
}

void onError(String e) => fail(e);

void main() async {
  await _aiUseCase.tokenLogin(
    token: '', //Введите сюда свой токен для теста
    onResponse: (_) {},
    onError: (_) {
      return;
    },
  );
  group('ai test', () {
    test('getCompletion', () async {
      await _aiUseCase.getCompletion(
        prompt:
            'сколько первичных баллов можно получить за 19 задание ЕГЭ по профильной математике',
        onResponse: onResponse<String>,
        onError: onError,
      );
    });
  });
}

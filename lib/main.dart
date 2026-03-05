import 'package:flutter/material.dart';
import 'package:students_ege_helper/domain/use_cases/extended_ai_use_case.dart';
import 'package:students_ege_helper/presentation/widgets/application.dart';

final ExtendedAiUseCase aiUseCase = .new(
  dio: .new(.new(baseUrl: 'https://openrouter.ai/api/v1')),
);

void main() {
  runApp(Application());
}

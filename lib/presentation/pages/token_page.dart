import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:students_ege_helper/main.dart';
import 'package:students_ege_helper/presentation/theme/extension.dart';
import 'package:students_ege_helper/presentation/typography/custom_styles.dart';
import 'package:students_ege_helper/presentation/widgets/custom_button.dart';
import 'package:students_ege_helper/presentation/widgets/custom_input.dart';
import 'package:students_ege_helper/presentation/widgets/utils.dart';

class TokenPage extends StatefulWidget {
  const TokenPage({super.key});

  @override
  State<TokenPage> createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  final TextEditingController _tokenController = .new();

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.palette.background,
      body: Padding(
        padding: MediaQuery.paddingOf(
          context,
        ).add(.symmetric(vertical: 32.h, horizontal: 20.w)),
        child: Column(
          spacing: 20.h,
          crossAxisAlignment: .start,
          children: [
            Text(
              'Ввод токена',
              style: CustomStyles.nunitoBold32.copyWith(
                color: theme.palette.text,
              ),
            ),
            Text(
              'Для продолжения необходим токен (Можно получить на сайте openrouter.ai)',
              style: CustomStyles.nunitoMedium14.copyWith(
                color: theme.palette.text,
              ),
            ),
            SizedBox(
              width: 336.w,
              child: CustomInput(
                controller: _tokenController,
                label: 'token',
                hint: 'Введите токен',
              ),
            ),
            Expanded(child: SizedBox()),
            SizedBox(
              width: 336.w,
              child: CustomButton(
                type: .standart,
                onPressed: _processTokenLogin,
                text: 'Использовать токен',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _processTokenLogin() async {
    await aiUseCase.tokenLogin(
      token: _tokenController.text,
      onResponse: (_) => Get.back(),
      onError: (e) => showError(e),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:students_ege_helper/presentation/pages/token_page.dart';
import 'package:students_ege_helper/presentation/theme/extension.dart';
import 'package:students_ege_helper/presentation/typography/custom_styles.dart';
import 'package:students_ege_helper/presentation/widgets/custom_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _requestController = TextEditingController();

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
          crossAxisAlignment: .stretch,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                SizedBox.square(
                  dimension: 40.r,
                  child: CustomButton(
                    type: .icon,
                    onPressed: () => Get.to(TokenPage()),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24.r,
                      color: theme.palette.text,
                    ),
                  ),
                ),
                Text(
                  'ИИ помощник ученика',
                  style: CustomStyles.nunitoBold24.copyWith(
                    color: theme.palette.text,
                  ),
                  textAlign: .center,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  controller: _requestController,
                  style: CustomStyles.nunitoMedium14.copyWith(
                    color: theme.palette.text,
                  ),
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Введите свой вопрос',
                    hintStyle: CustomStyles.nunitoMedium14.copyWith(
                      color: theme.palette.hint,
                    ),
                    enabledBorder: .none,
                    focusedBorder: .none,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 336.w,
              child: CustomButton(
                type: .simple,
                onPressed: () {},
                text: 'Отправить запрос',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

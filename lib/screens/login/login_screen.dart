import 'package:daelim_univ/common/app_assets.dart';
import 'package:daelim_univ/common/widgets/app_icon_text_button.dart';
import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:daelim_univ/screens/login/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController pwController;

  @override
  void initState() {
    emailController = TextEditingController();
    pwController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 80,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 앱 로고
              Image.asset(
                AppAssets.logoFlutter,
                width: 150,
              ),

              const SizedBox(height: 200),

              // 이메일 입력
              LoginTextField(
                controller: emailController,
                labelText: '이메일',
              ),

              const SizedBox(height: 30),

              // 패스워드 입력
              LoginTextField(
                controller: pwController,
                labelText: '비밀번호',
              ),

              const SizedBox(height: 200),

              // 로그인 버튼
              AppIconTextButton(
                text: '로그인',
                icon: Icons.login,
                onPressed: () {
                  var email = emailController.text;
                  var password = pwController.text;

                  if (email != 'aaa' || password != '1234') {
                    return;
                  }

                  // 메인 화면 이동
                  context.go(AppScreen.main);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

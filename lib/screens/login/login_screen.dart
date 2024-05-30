// ignore_for_file: use_build_context_synchronously
import 'package:daelim_univ/common/app_assets.dart';
import 'package:daelim_univ/common/widgets/app_icon_text_button.dart';
import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/localization/app_string.dart';
import 'package:daelim_univ/provider/auth_controller.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:daelim_univ/screens/login/widgets/login_text_field.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

// Log.green(jsonDecode(utf8.decode(response.bodyBytes)));

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = Get.find<AuthController>();

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

  void _signIn() async {
    var email = emailController.text;
    var password = pwController.text;

    var result = await _controller.signIn(
      email: email,
      password: password,
    );

    var succes = result.$1;
    var errorMsg = result.$2;

    if (!succes) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '로그인을 실패했습니다.\n$errorMsg',
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      );

      return;
    }

    context.pushReplacement(AppScreen.main);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
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

              100.heightBox,

              // 이메일 입력
              LoginTextField(
                controller: emailController,
                labelText: AppString.email.tr,
              ),

              30.heightBox,

              // 패스워드 입력
              LoginTextField(
                controller: pwController,
                labelText: AppString.password.tr,
                obscureText: true,
              ),

              const SizedBox(height: 100),

              // 로그인 버튼
              AppIconTextButton(
                text: '${AppString.login.tr}테스트',
                icon: Icons.login,
                onPressed: _signIn,
              ),

              10.heightBox,

              // 회원가입 버튼
              TextButton(
                onPressed: () => context.go(AppScreen.signUp),
                child: Text(
                  AppString.signUp.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

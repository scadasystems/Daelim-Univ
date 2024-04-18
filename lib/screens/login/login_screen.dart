// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:daelim_univ/common/app_assets.dart';
import 'package:daelim_univ/common/widgets/app_icon_text_button.dart';
import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:daelim_univ/screens/login/widgets/login_text_field.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

// Log.green(jsonDecode(utf8.decode(response.bodyBytes)));

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
                obscureText: true,
              ),

              const SizedBox(height: 100),

              // 로그인 버튼
              AppIconTextButton(
                text: '로그인',
                icon: Icons.login,
                onPressed: () async {
                  var email = emailController.text;
                  var password = pwController.text;

                  // Future<int> testFuture() async {
                  //   throw Exception('에러 발생');
                  //   return 0;
                  // }

                  // var value = await testFuture().catchError(
                  //   (e, stackTrace) {
                  //     Log.red('E: $e');
                  //     Log.red('Stack: $stackTrace');
                  //     return -1;
                  //   },
                  // );

                  // Log.green('반환: $value');

                  var response = await http
                      .post(
                        Uri.parse(
                          'http://121.140.73.79:60080/functions/v1/auth/login',
                        ),
                        body: jsonEncode({
                          'email': email,
                          'password': password,
                        }),
                      )
                      .timeout(10.toSecond)
                      .catchError((e, stackTrace) {
                    Log.red('$e, $stackTrace');
                    return http.Response('$e', 401);
                  });

                  var status = response.statusCode;
                  var body = response.body;

                  if (status != 200) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '로그인을 실패했습니다. $status',
                          style: const TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                    );

                    return;
                  }

                  // 200 Success 처리
                  Log.green(body);

                  context.pushReplacement(AppScreen.main);
                },
              ),

              10.heightBox,

              // 회원가입 버튼
              TextButton(
                onPressed: () => context.go(AppScreen.signUp),
                child: const Text(
                  '회원가입',
                  style: TextStyle(
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

import 'dart:convert';

import 'package:daelim_univ/common/widgets/app_icon_text_button.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:daelim_univ/screens/login/widgets/login_text_field.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _pwKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _pwConfirmKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _stnKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _pwController;
  late TextEditingController _pwConfirmController;
  late TextEditingController _nameController;
  late TextEditingController _stnController;

  List<(GlobalKey<FormState>, TextEditingController, String)> get _buttons => [
        (_emailKey, _emailController, '이메일'),
        (_pwKey, _pwController, '비밀번호'),
        (_pwConfirmKey, _pwConfirmController, '비밀번호 확인'),
        (_nameKey, _nameController, '이름'),
        (_stnKey, _stnController, '학번'),
      ];

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _pwController = TextEditingController();
    _pwConfirmController = TextEditingController();
    _nameController = TextEditingController();
    _stnController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _pwConfirmController.dispose();
    _nameController.dispose();
    _stnController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushReplacement(AppScreen.login);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // TextForm
            Expanded(
              child: ListView.separated(
                itemCount: _buttons.length,
                padding: const EdgeInsets.all(20),
                separatorBuilder: (context, index) => 10.heightBox,
                itemBuilder: (context, index) {
                  var button = _buttons[index];

                  return LoginTextField(
                    formKey: button.$1,
                    controller: button.$2,
                    labelText: button.$3,
                    obscureText: button.$3.contains('비밀번호'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '값을 입력해주세요.';
                      }

                      if (button.$3 == '이름') {
                        if (value.length != 3) {
                          return '정확한 이름을 적어주세요.';
                        }
                      }

                      if (button.$3 == '비밀번호 확인') {
                        if (value != _pwController.text) {
                          return '패스워드가 일치하지 않습니다.';
                        }
                      }

                      return null;
                    },
                  );
                },
              ),
            ),
            // 회원가입 버튼
            AppIconTextButton(
              onPressed: () async {
                var checkEmail = _emailKey.currentState?.validate() ?? false;
                var checkPw = _pwKey.currentState?.validate() ?? false;
                var checkPwConfirm = _pwConfirmKey.currentState?.validate() ?? false;
                var checkName = _nameKey.currentState?.validate() ?? false;
                var checkStudentNumber = _stnKey.currentState?.validate() ?? false;

                if (!checkEmail || //
                    !checkPw ||
                    !checkPwConfirm ||
                    !checkName ||
                    !checkStudentNumber) {
                  return;
                }

                final email = _emailController.text;
                final pw = _pwController.text;
                final name = _nameController.text;
                final studentNumber = _stnController.text;

                var response = await http.post(
                  Uri.parse(
                    'http://121.140.73.79:60080/functions/v1/auth/signup',
                  ),
                  body: jsonEncode({
                    'email': email,
                    'password': pw,
                    'name': name,
                    'student_number': studentNumber,
                  }),
                );

                var status = response.statusCode;
                var body = response.body;

                if (status != 200) {
                  return Log.red('회원가입 에러: $status, $body');
                }
              },
              text: '회원가입',
            ),

            20.heightBox,
          ],
        ),
      ),
    );
  }
}

import 'package:daelim_univ/common/app_assets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController?.dispose();
    emailController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                TextField(
                  controller: emailController,
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이메일',
                  ),
                ),

                // 패스워드 입력
                const TextField(),

                const SizedBox(height: 200),

                // 로그인 버튼
                MaterialButton(
                  onPressed: () {
                    var email = emailController?.text;

                    debugPrint('이메일: $email');
                  },
                  color: const Color.fromARGB(255, 29, 124, 141),
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

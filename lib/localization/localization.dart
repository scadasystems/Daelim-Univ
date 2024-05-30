import 'package:daelim_univ/localization/app_string.dart';
import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          //! Login
          AppString.email: 'Email',
          AppString.password: 'Password',
          AppString.login: 'Login',
          AppString.signUp: 'Sign Up',
          //! Drawer
          AppString.home: 'Home',
          AppString.lifecycle: 'Lifecycle',
          AppString.gallery: 'Gallery',
          AppString.appSetting: 'App Setting',
        },
        'ko_KR': {
          //! Login
          AppString.email: '이메일',
          AppString.password: '패스워드',
          AppString.login: '로그인',
          AppString.signUp: '회원가입',
          //! Drawer
          AppString.home: '홈',
          AppString.lifecycle: '라이프사이클',
          AppString.gallery: '갤러리',
          AppString.appSetting: '앱 설정',
        },
      };
}

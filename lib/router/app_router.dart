import 'package:daelim_univ/screens/gallery/gallery_screen.dart';
import 'package:daelim_univ/screens/login/login_screen.dart';
import 'package:daelim_univ/screens/main/main_screen.dart';
import 'package:daelim_univ/screens/sign_up/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: AppScreen.login,
  routes: [
    // 로그인
    GoRoute(
      path: AppScreen.login,
      builder: (context, state) => const LoginScreen(),
    ),
    // 회원가입
    GoRoute(
      path: AppScreen.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),
    // 메인
    GoRoute(
      path: AppScreen.main,
      builder: (context, state) => const MainScreen(),
    ),
    // 갤러리
    GoRoute(
      path: AppScreen.gallery,
      builder: (context, state) => const GalleryScreen(),
    ),
  ],
);

class AppScreen {
  static String login = '/login';
  static String signUp = '/signUp';
  static String main = '/main';
  static String gallery = '/gallery';
}

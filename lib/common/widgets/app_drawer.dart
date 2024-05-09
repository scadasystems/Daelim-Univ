import 'package:daelim_univ/provider/auth_controller.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget _listTile(
    BuildContext context, {
    required String path,
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      onTap: () => context.go(path),
      leading: Icon(
        icon,
        size: 40,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    final userData = controller.userData;

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: ListTile(
              title: Text(
                userData != null //
                    ? '${userData.name} (${userData.stdNumber})'
                    : '로그인 상태가 아닙니다.',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: userData != null //
                  ? Text(
                      userData.email,
                      style: const TextStyle(fontSize: 18),
                    )
                  : null,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _listTile(
                  context,
                  path: AppScreen.main,
                  icon: Icons.home,
                  title: '홈',
                ),
                _listTile(
                  context,
                  path: AppScreen.lifecycle,
                  icon: Icons.sync,
                  title: '라이프사이클',
                ),
                _listTile(
                  context,
                  path: AppScreen.gallery,
                  icon: Icons.image,
                  title: '갤러리',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

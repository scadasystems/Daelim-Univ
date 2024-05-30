import 'package:daelim_univ/localization/app_string.dart';
import 'package:daelim_univ/provider/auth_controller.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

  List<Map<String, dynamic>> get _tilesData => [
        {
          'path': AppScreen.main,
          'icon': Icons.home,
          'title': AppString.home.tr,
        },
        {
          'path': AppScreen.lifecycle,
          'icon': Icons.sync,
          'title': AppString.lifecycle.tr,
        },
        {
          'path': AppScreen.gallery,
          'icon': Icons.image,
          'title': AppString.gallery.tr,
        }
      ];

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
              children: _tilesData.mapIndexed((i, e) {
                return _listTile(
                  context,
                  path: e['path'],
                  icon: e['icon'],
                  title: e['title'],
                ).animate().slideX(delay: (i * 200).toMillisecond);
              }).toList(),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () => context.go(AppScreen.setting),
            child: ListTile(
              title: Text(
                AppString.appSetting.tr,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: const Icon(Icons.arrow_right),
            ),
          ),
        ],
      ),
    );
  }
}

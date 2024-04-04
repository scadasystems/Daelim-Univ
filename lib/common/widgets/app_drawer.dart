import 'package:daelim_univ/router/app_router.dart';
import 'package:flutter/material.dart';
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
        size: 60,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            path: AppScreen.gallery,
            icon: Icons.image,
            title: '갤러리',
          ),
        ],
      ),
    );
  }
}

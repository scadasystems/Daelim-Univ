import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/provider/setting_controller.dart';
import 'package:daelim_univ/router/app_router.dart';
import 'package:day_night_themed_switch/day_night_themed_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());

    return AppScaffold(
      appBar: AppBar(
        title: const Text('앱 설정'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Column(
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    ListTile(
                      title: const Text(
                        '다크 모드',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      leading: const Icon(Icons.brightness_6),
                      trailing: SizedBox(
                        width: 80,
                        height: 40,
                        child: Obx(
                          () => DayNightSwitch(
                            value: controller.rxIsDarkMode.value,
                            onChanged: controller.changeThemeMode,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => context.pushNamed(AppScreen.settingLocale),
                      child: const ListTile(
                        title: Text(
                          '언어',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        leading: Icon(Icons.language),
                      ),
                    ),
                  ],
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

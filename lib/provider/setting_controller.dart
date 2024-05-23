import 'package:daelim_univ/common/helpers/storage_helper.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  final RxBool rxIsDarkMode = StorageHelper.isDarkMode.obs;

  void changeThemeMode(bool isDarkMode) {
    Log.green('다크모드: $isDarkMode');
    rxIsDarkMode.value = isDarkMode;

    StorageHelper.setDarkMode(isDarkMode);
  }
}


import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../util/common.dart';



enum MainBoxKeys {
  email,
  isLogin,
}

@singleton
mixin class MainBoxMixin {
  static late Box? mainBox;
  static const _boxName = 'lifebonder';

  static Future<void> initHive(String prefixBox) async {
    // Initialize hive (persistent database)
    await Hive.initFlutter();
    mainBox = await Hive.openBox('$prefixBox$_boxName');
  }

  Future<void> addData<T>(MainBoxKeys key, T value) async {
    await mainBox?.put(key.name, value);
  }

  Future<void> removeData(MainBoxKeys key) async {
    await mainBox?.delete(key.name);
  }

  T getData<T>(MainBoxKeys key) => mainBox?.get(key.name) as T;

  Future<void> logoutBox() async {
    /// Clear the box
    removeData(MainBoxKeys.isLogin);
    removeData(MainBoxKeys.email);
  }

  Future<void> closeBox({bool isUnitTest = false}) async {
    try {
      if (mainBox != null) {
        await mainBox?.close();
        await mainBox?.deleteFromDisk();
      }
    } catch (e, _) {

      log.e(e.toString());

    }
  }
}

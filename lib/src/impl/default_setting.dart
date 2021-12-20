import 'dart:async';

import 'package:hive/hive.dart';
import 'package:settings/src/interface/setting.dart';

class DefaultSetting implements Setting {
  @override
  String get(String key, defaultValue) {
    return box!.get(key, defaultValue: defaultValue);
  }

  @override
  void set(String key, String value) {
    box!.put(key, value);
  }
}

Box? box;

Future<void> initSettingStore(String path) async {
  box ??= await Hive.openBox('setting', path: path);
}

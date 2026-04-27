library settings;

import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

Box? box;

Future<void> initSettingStore(String path) async {
  // 将来需要这个来适配浏览器
  // Hive.init 可以传递 backendPreference
  // In the future, we might want to adapt this for browsers by allowing backendPreference to be passed to Hive.init
  Hive.init(path);
  box ??= await Hive.openBox('setting');
}

Map<Setting, ValueNotifier> _valueMap = {};

// deprecated, use Setting instead
@Deprecated('Use Setting instead')
typedef SettingNode = Setting;

class Setting {
  Setting(this.key);
  final String key;
  ValueNotifier get ob {
    if (_valueMap.containsKey(this)) {
      return _valueMap[this]!;
    } else {
      return _valueMap[this] = ValueNotifier(get());
    }
  }

  dynamic get value {
    return get();
  }

  set value(dynamic value) {
    set(value);
    ob.value = value;
  }

  dynamic get() {
    return box!.get(key, defaultValue: null);
  }

  void set(dynamic value) {
    box!.put(key, value);
  }
}

extension SettingExt on String {
  Setting get setting => Setting(this);
}

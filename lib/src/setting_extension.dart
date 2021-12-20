import 'package:flutter/foundation.dart';

import 'impl/default_setting.dart';

DefaultSetting defaultSetting = DefaultSetting();
Map<String, ValueNotifier> _valueMap = {};

extension Setting on String {
  ValueNotifier get ob {
    if (_valueMap.containsKey(this)) {
      return _valueMap[this]!;
    } else {
      return _valueMap[this] = ValueNotifier(getFromStore);
    }
  }

  String get getFromStore {
    return defaultSetting.get(this, '');
  }

  String get get {
    return ob.value;
  }

  set set(dynamic value) {
    ob.value = value;
    return defaultSetting.set(this, value);
  }
}

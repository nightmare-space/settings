import 'package:flutter/foundation.dart';

import 'impl/default_setting.dart';

DefaultSetting defaultSetting = DefaultSetting();

extension SettingNodeExt on String {
  SettingNode get settingNode => SettingNode(this);
}

extension SettingExt on String {
  Setting get setting => Setting(this);
}

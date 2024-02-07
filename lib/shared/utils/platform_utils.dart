import 'dart:io';

import '../constants/constant.dart';

abstract class PlatformUtils {
  int getPlatform();
}

class PlatformUtilsImpl implements PlatformUtils {
  /// returns 1 for android 2 for iOS and -1 for other platforms
  @override
  int getPlatform() {
    int platform = otherPlatform;

    if (Platform.isAndroid) {
      platform = androidPlatform;
    } else if (Platform.isIOS) {
      platform = iOSPlatform;
    }

    return platform;
  }
}

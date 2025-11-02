import 'dart:developer' show log;

import 'package:flutter/foundation.dart' show kDebugMode;

void debugLog(String message) {
  if (kDebugMode) {
    log(message);
  }
}

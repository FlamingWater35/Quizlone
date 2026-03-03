import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'web/history_stub.dart'
    if (dart.library.js_interop) 'web/history_web.dart';

class NavigationService {
  static void back(BuildContext context) {
    if (kIsWeb) {
      browserBack();
    } else {
      context.router.maybePop();
    }
  }
}

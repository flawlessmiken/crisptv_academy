import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'core/session_manager/session_manager.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();
  setupLocator();
  await SessionManager.instance.init();

  runApp(const App());
}

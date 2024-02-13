import 'package:flutter/material.dart';
import 'package:flutter_kit/app.dart';

import 'di.dart';


Future<void> main() async {
 await initAppModule();
  runApp(const App());
}


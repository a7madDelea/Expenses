import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'expenses.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight, 
  ]).then(
    (_) => runApp(const Expenses()),
  );
}

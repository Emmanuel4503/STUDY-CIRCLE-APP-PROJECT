import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pdfrx/pdfrx.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await pdfrxFlutterInitialize();

  runApp(const App());
}

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/presentation/core/app.dart';

import 'injection.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(const MyApp());
}

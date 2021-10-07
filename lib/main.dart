import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_series/presentation/core/app.dart';

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(const MyApp());
}

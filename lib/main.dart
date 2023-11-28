import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/app_provider.dart';
import 'providers/counter_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
    ),
  ], child: const App()));
}

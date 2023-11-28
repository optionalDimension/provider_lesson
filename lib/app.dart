import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lesson/providers/app_provider.dart';
import 'package:provider_lesson/providers/counter_provider.dart';
import 'package:provider_lesson/styles/theme_style.dart';
import 'home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<AppProvider>().themeMode,
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

import 'package:abac_project/ui/home_page/home_page.dart';
import 'package:abac_project/themes/primary_swatch_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: mainColor)),
        primarySwatch: createMaterialColor(mainColor),
      ),
    );
  }
}

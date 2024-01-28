import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:motivational/src/features/home/presentation/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

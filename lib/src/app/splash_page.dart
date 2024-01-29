import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:motivational/src/core/repository/auth_repository.dart';
import 'package:motivational/src/core/routes/routes.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.homePage);
    });

    return const ScaffoldWrapper();
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:motivational/core/assets/assets.gen.dart';
import 'package:motivational/src/core/routes/routes.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 0, end: 1.0).animate(_controller);

    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.homePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                  height: 120,
                  width: 120,
                  // decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: SvgPicture.asset(Assets.svg.logo.path))),
                  child: SvgPicture.asset(Assets.svg.logo.path)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: Stack(
        children: [
          Container(
            color: AppColors.black,
          )
        ],
      ),
    );
  }
}

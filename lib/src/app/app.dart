import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:motivational/src/core/routes/routes.dart';
import 'package:motivational/src/features/home/bloc/get_random/get_random_quotes_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        initialRoute: AppRoutes.splash,
        getPages: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return BlocProvider(create: (context) => GetRandomQuotesCubit(), child: child!);
        },
      ),
    );
  }
}

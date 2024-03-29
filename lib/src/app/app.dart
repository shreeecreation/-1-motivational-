import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:motivational/src/core/routes/routes.dart';
import 'package:motivational/src/features/auth/screens/blocs/auth/auth_cubit.dart';
import 'package:motivational/src/features/auth/screens/blocs/user/user_cubit.dart';
import 'package:motivational/src/features/home/bloc/favorite_saver/favorite_saver_cubit.dart';
import 'package:motivational/src/features/home/bloc/fetch_image/image_cubit.dart';
import 'package:motivational/src/features/home/bloc/get_random/get_random_quotes_cubit.dart';
import 'package:motivational/src/features/home/bloc/painter_saver/painter_saver_cubit.dart';
import 'package:motivational/src/features/home/bloc/sound_controller/save_sound_cubit.dart';
import 'package:motivational/src/features/home/bloc/sound_controller/toggle_sound_cubit.dart';
import 'package:motivational/src/features/home/bloc/toggle_favorite/toggle_favorite_cubit.dart';
import 'package:motivational/src/features/home/presentation/widgets/quote_viewer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PainterSaverCubit()),
        BlocProvider(create: (context) => FavoriteSaverCubit()..getList()),
        BlocProvider(create: (context) => GetRandomQuotesCubit()),
        BlocProvider(create: (context) => SaveSoundCubit()..getSound()),
        BlocProvider(create: (context) => ImageCubit()..getImages()),
        BlocProvider(create: (context) => ToggleSoundCubit()..toggleSound()),
        BlocProvider(create: (context) => UserCubit()..listenForAuthChanges(), lazy: false),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ToggleFavoriteCubit()),
      ],
      child: ScreenUtilInit(
        child: Builder(builder: (context) {
          final color = context.watch<PainterSaverCubit>().state.color;
          return GetMaterialApp(
            initialRoute: AppRoutes.splash,
            getPages: AppRoutes.routes,
            theme: ThemeData(
              colorScheme: color != null
                  ? isColorDark(color)
                      ? const ColorScheme.dark()
                      : const ColorScheme.light()
                  : const ColorScheme.light(),
            ),
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return child!;
            },
          );
        }),
      ),
    );
  }
}

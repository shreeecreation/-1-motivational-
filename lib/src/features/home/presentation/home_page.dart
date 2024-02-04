import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:motivational/src/core/repository/auth_repository.dart';
import 'package:motivational/src/core/routes/routes.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/widgets/custom_button.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';
import 'package:motivational/src/features/auth/screens/auth_bottom_sheet.dart';
import 'package:motivational/src/features/home/bloc/get_random/get_random_quotes_cubit.dart';
import 'package:motivational/src/features/home/bloc/painter_saver/painter_saver_cubit.dart';
import 'package:motivational/src/features/home/bloc/share/share_cubit.dart';
import 'package:motivational/src/features/home/bloc/sound_controller/save_sound_cubit.dart';
import 'package:motivational/src/features/home/bloc/sound_controller/toggle_sound_cubit.dart';
import 'package:motivational/src/features/home/domain/constant/painter_constant.dart';
import 'package:motivational/src/features/home/presentation/widgets/quote_viewer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late ScreenshotController screenshotController;
  late AudioPlayer _audioPlayer;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..setLoopMode(LoopMode.all);

    WidgetsBinding.instance.addObserver(MyAppLifecycleObserver(
        audioPlayer: _audioPlayer,
        onResumed: () {
          !isMuted ? _audioPlayer.play() : _audioPlayer.stop();
        }));

    screenshotController = ScreenshotController();
    context.read<GetRandomQuotesCubit>().getRandomQuotes();
    context.read<PainterSaverCubit>().getPainter();
    context.read<ToggleSoundCubit>().toggleSound();
  }

  @override
  void dispose() {
    _audioPlayer.stop();

    _audioPlayer.dispose();
    super.dispose();
  }

  int page = 0;

  @override
  Widget build(BuildContext context) {
    final backgroundElement = context.watch<PainterSaverCubit>().state;

    return BlocProvider(
      create: (context) => ShareCubit(),
      child: Builder(builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<ShareCubit, ShareState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () => null,
                  success: (image) {
                    Share.shareXFiles(
                      [XFile(image)],
                      subject: 'Made with Motivator App',
                    );
                  },
                );
              },
            ),
            BlocListener<SaveSoundCubit, SaveSoundState>(
              listener: (context, state) {
                state.maybeWhen(
                    orElse: () => null,
                    saveSound: (soundPathIndex) {
                      _audioPlayer.setAsset(PainterConstatnt.musicConstant.entries.elementAt(soundPathIndex).value);
                    });
              },
            ),
            BlocListener<ToggleSoundCubit, ToggleSoundState>(
              // bloc: context.read<ToggleSoundCubit>()..toggleSound(),
              listener: (context, state) {
                state.maybeWhen(
                    orElse: () {},
                    toggle: (value) {
                      isMuted = !value;
                      value ? _audioPlayer.play() : _audioPlayer.pause();
                    });
              },
            ),
          ],
          // child:
          child: ScaffoldWrapper(
            body: Stack(
              children: [
                Screenshot(
                  controller: screenshotController,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: backgroundElement.image == null || backgroundElement.image == ''
                            ? const SizedBox.shrink()
                            : Image.file(
                                File(backgroundElement.image!),
                                fit: BoxFit.cover,
                              ),
                      ),
                      BlocBuilder<GetRandomQuotesCubit, GetRandomQuotesState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => const SizedBox.shrink(),
                            loading: () {
                              return const Center(child: CircularProgressIndicator());
                            },
                            noInternet: () {
                              Future.delayed(const Duration(milliseconds: 500), () async {
                                Get.offNamed(AppRoutes.noInternet);
                              });
                              return const SizedBox.shrink();
                            },
                            success: (data, _, hasMoreItems) {
                              return PageView.builder(
                                onPageChanged: (value) {
                                  page = value;
                                  if (page == data.length - 2) {
                                    context.read<GetRandomQuotesCubit>().addMoreRandomQuotes();
                                  }
                                },
                                scrollDirection: Axis.vertical,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return QuoteViewer(
                                    quote: data[index],
                                    screenshotController: screenshotController,
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0, left: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomWidget(),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.read<ToggleSoundCubit>().toggleSound();
          },
          child: BlocBuilder<ToggleSoundCubit, ToggleSoundState>(
            builder: (context, state) {
              return CustomButton.iconText(
                label: '',
                labelStyle: AppStyles.text12PxMedium,
                onPressed: () {},
                icon: state.maybeWhen(
                  orElse: () {
                    return const Icon(Icons.abc);
                  },
                  toggle: (data) {
                    return Icon(data ? CupertinoIcons.speaker_2_fill : CupertinoIcons.speaker_slash_fill);
                  },
                ),
              );
            },
          ),
        ),
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: AppColors.statusRed,
              ),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.paintPage);
                },
                icon: const Icon(
                  Icons.format_paint_outlined,
                  color: AppColors.white,
                ),
              ),
            ),
            15.horizontalSpace,
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: AppColors.statusRed,
              ),
              child: IconButton(
                onPressed: () {
                  if (AuthRepository().authRepository.isSignedIn) {
                    Get.toNamed(AppRoutes.favoritePage);
                  } else {
                    AuthBottomSheet.show(context);
                  }
                },
                icon: const Icon(
                  Icons.favorite,
                  color: AppColors.white,
                ),
              ),
            ),
            15.horizontalSpace,
            // BlocConsumer<UserCubit, UserState>(
            //   listener: (context, state) {
            //     state.maybeWhen(
            //       orElse: () => null,
            //       success: (user) {
            //         Get.showSnackbar(GetSnackBar(
            //           message: 'Welcome ${user.data['name']}',
            //           snackPosition: SnackPosition.TOP,
            //           margin: const EdgeInsets.all(20),
            //           duration: const Duration(seconds: 2),
            //         ));
            //       },
            //     );
            //   },
            //   builder: (context, state) {
            //     return state.maybeWhen(
            //       orElse: SizedBox.shrink,
            //       success: (user) {
            //         return Container(
            //           decoration: const BoxDecoration(
            //             borderRadius: BorderRadius.all(
            //               Radius.circular(10),
            //             ),
            //             color: AppColors.black,
            //           ),
            //           height: 40,
            //           width: 40,
            //           child: Center(
            //             child: Text(
            //               (user.data['name'] as String),
            //               style: AppStyles.text14PxBold.copyWith(
            //                 color: AppColors.white,
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     );
            //   },
            // ),
            15.horizontalSpace,
          ],
        ),
      ],
    );
  }
}

class MyAppLifecycleObserver extends WidgetsBindingObserver {
  final AudioPlayer audioPlayer;
  final void Function() onResumed;

  MyAppLifecycleObserver({required this.audioPlayer, required this.onResumed});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      // Stop the audio player when the app is paused or inactive
      audioPlayer.stop();
    }
    if (state == AppLifecycleState.resumed) {
      onResumed();
    }
  }
}

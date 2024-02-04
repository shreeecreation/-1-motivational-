import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/widgets/context.extension.dart';
import 'package:motivational/src/features/auth/screens/blocs/auth/auth_cubit.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class AuthBottomSheet extends StatefulWidget {
  const AuthBottomSheet({Key? key}) : super(key: key);

  @override
  State<AuthBottomSheet> createState() => _AuthBottomSheetState();

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const AuthBottomSheet(),
    );
  }
}

class _AuthBottomSheetState extends State<AuthBottomSheet> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              },
              success: () {
                Navigator.of(context).pop();
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(orElse: () {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  18.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sign in to Motivator and get access to all features',
                      textAlign: TextAlign.center,
                      style: AppStyles.text18Px,
                    ),
                  ),
                  18.verticalSpace,
                  SocialLoginButton(
                    borderRadius: 8.0,
                    backgroundColor: AppColors.textBlue,
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {
                      context.read<AuthCubit>().loginWithFacebook();
                    },
                    text: 'Continue with Facebook',
                    height: 52.0,
                  ),
                  18.verticalSpace,
                  SocialLoginButton(
                    borderRadius: 8,
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () {
                      context.read<AuthCubit>().loginWithGoogle();
                    },
                    text: 'Continue with Google',
                    height: 52.0,
                  ),
                  18.verticalSpace,
                  if (Platform.isIOS)
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.appleBlack,
                      onPressed: () {
                        context.read<AuthCubit>().loginWithApple();
                      },
                      height: 42.0,
                      text: 'Contiue with Apple',
                    ),
                  18.verticalSpace,
                ],
              );
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, success: () {
              context.showSnackbar(title: "Authentication", message: "Authentication Completed", error: false);
              Navigator.pop(context);
              return const SizedBox.shrink();
            });
          },
        ),
      );
    });
  }
}

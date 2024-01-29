import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motivational/src/core/repository/auth_repository.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          18.verticalSpace,
          Text(
            'Easily discover a variety of news with just a tap.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          18.verticalSpace,
          SocialLoginButton(
            buttonType: SocialLoginButtonType.facebook,
            onPressed: () {
              AuthRepository().signInWithGoogle();
            },
            text: 'Continue with Facebook',
            height: 42.0,
          ),
          18.verticalSpace,
          SocialLoginButton(
            buttonType: SocialLoginButtonType.google,
            onPressed: () {},
            text: 'Continue with Google',
            height: 42.0,
          ),
          18.verticalSpace,
          SocialLoginButton(
            buttonType: SocialLoginButtonType.appleBlack,
            onPressed: () {},
            height: 42.0,
            text: 'Contiue with Apple',
          ),
          18.verticalSpace,
        ],
      ),
    );
  }

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const AuthBottomSheet(),
    );
  }
}

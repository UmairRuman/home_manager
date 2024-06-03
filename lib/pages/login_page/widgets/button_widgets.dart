import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_button.dart';

import 'package:flutter_project_home_manager/utils/shared_prefernces_constants.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginButton extends ConsumerStatefulWidget {
  const LoginButton({super.key});

  @override
  ConsumerState<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends ConsumerState<LoginButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    
    onClick() {
      
      GetIt.I<SharedPreferences>()
        .setBool(SharedPreferencesConstant.kAccountCreatedButLogout, false);
      
    }

    return AppCommonButton(
        width: size.width * 0.7,
        backgroundColor: Colors.blue,
        buttonText: 'Login',
        onClick: onClick,
        buttonIcon: Icons.login);
  }
}

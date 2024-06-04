import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/profile_page/controller/profile_page_controller.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/delete_account_button.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/logout_button.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/password_key_reset_field.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/password_reset_field.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/profile_picture.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/update_password_button.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/username_text.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});
  static const pageAddress = '/profilePage';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/textureBackgroundTwo.jpg'),
              fit: BoxFit.cover,
              opacity: 0.5),
        ),
        child: Center(
          child: Form(
            // key: controller.passwordFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfilePicture(),
                  UsernameTextProfilePage(),
                  PasswordResetInputField(),
                  PasswordKeyResetInputField(),
                  UpdatePasswordButton(),
                  LogoutButton(),
                  DeleteAccountButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

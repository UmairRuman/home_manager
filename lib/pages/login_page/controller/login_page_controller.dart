import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/home_page/view/home_page.dart';
import 'package:flutter_project_home_manager/pages/login_page/controller/login_page_states.dart';
import 'package:flutter_project_home_manager/utils/shared_prefernces_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final logingPageProvider =
    NotifierProvider<LoginPageController, LoginPageState>(
        LoginPageController.new);

class LoginPageController extends Notifier<LoginPageState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // authentic username and password
  SharedPreferences sharedData = GetIt.I<SharedPreferences>();
  String? username, password;

  loginButtonOnClick(BuildContext context) {
    if (formKey.currentState!.validate()) {
      sharedData.setBool(
          SharedPreferencesConstant.kAccountCreatedButLogout, false);
      usernameController.text = '';
      passwordController.text = '';
      Navigator.popAndPushNamed(context, HomePage.pageAddress);
    }
  }

  // validator for username field
  String? validatorForUsernameField(String? value) {
    if (value == '' && value == null) {
      return 'Required field is empty';
    } else if (username != null) {
      username != value ? 'user not exists' : null;
    }
    return null;
  }

  String? validatorForPasswordField(String? value) {
    if (validatorForUsernameField(usernameController.text) != null) {
      return '';
    } else if (value == null && value == '') {
      return 'field is empty';
    } else if (value != password) {
      return 'password is not correct';
    } else {
      return null;
    }
  }

  @override
  LoginPageState build() {
    username = sharedData
        .getString(SharedPreferencesConstant.kSharedPreferenceUsernameKey);
    password = sharedData
        .getString(SharedPreferencesConstant.kSharedPreferencePasswordKey);
    return LoginPageInitialState();
  }
}

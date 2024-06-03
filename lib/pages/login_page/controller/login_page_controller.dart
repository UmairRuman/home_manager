import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/login_page/controller/login_page_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logingPageProvider =
    NotifierProvider<LoginPageController, LoginPageState>(
        LoginPageController.new);

class LoginPageController extends Notifier<LoginPageState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  LoginPageState build() {
    return LoginPageInitialState();
  }
}

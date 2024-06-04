import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/login_page/widgets/title_image_widget.dart';
import 'package:flutter_project_home_manager/pages/signup_page/controller/signup_page_controller.dart';
import 'package:flutter_project_home_manager/pages/signup_page/widgets/button_widgets.dart';
import 'package:flutter_project_home_manager/pages/signup_page/widgets/text_fields_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});
  static const pageAddress = '/signupPage';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Size(:height, :width) = MediaQuery.sizeOf(context);
    final iconWidth = width * 0.7;
    final formHeight = height * 0.9;
    return PopScope(
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/signup_image.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.4)),
          child: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                height: formHeight,
                child: Form(
                  key: ref.read(signupPageProvider.notifier).signupFromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleIconWidget(width: iconWidth),
                      const UsernameFieldSignup(),
                      const PasswordFieldSignup(),
                      const PasswordHintFieldSignup(),
                      const ToLoginScreenButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

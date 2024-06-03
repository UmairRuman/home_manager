import 'package:flutter/material.dart';

import 'package:flutter_project_home_manager/pages/login_page/widgets/button_widgets.dart';
import 'package:flutter_project_home_manager/pages/login_page/widgets/text_fields_widgets.dart';
import 'package:flutter_project_home_manager/pages/login_page/widgets/title_image_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  static const pageAddress = '/loginPage';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final Size(:height, :width) = MediaQuery.sizeOf(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/backgroundtwo.jpeg'),
                  fit: BoxFit.cover,
                  opacity: 0.4)),
          child: Center(
            child: Form(
              key: key,
              child: SizedBox(
                height: height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 12, child: TitleIconWidget(width: width * 0.4)),
                    const Spacer(),
                    const Expanded(flex: 7, child: UsernameTextFormField()),
                    const Spacer(),
                    const Expanded(flex: 7, child: PasswordTextFormField()),
                    const Spacer(),
                    const Expanded(flex: 4, child: LoginButton()),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:content_bytes/utils/context_extension.dart';
import 'package:content_bytes/view/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/database_helper.dart';
import '../widgets/card_widget.dart';
import '../widgets/my_box_widget.dart';
import '../widgets/my_theme.dart';
import '../widgets/text_button_widget.dart';
import '../widgets/text_field_widget.dart';
import 'contents_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: CardWidget(
            pb: 20,
            backgroundColor: MyTheme.burntSiennaColor,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.width * 0.45,
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Lottie.asset(
                    "assets/animation/login.json",
                    fit: BoxFit.cover,
                  ),
                ),
                MyBoxWidget(),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24),
                ),
                MyBoxWidget(
                  height: 30,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldWidget(
                          controller: contactController,
                          name: 'Mail or Phone',
                          filledColor: Theme.of(context).primaryColor.withOpacity(0.15),
                        ),
                        MyBoxWidget(),
                        TextFieldWidget(
                          controller: passwordController,
                          name: 'Password',
                          isObscured: true,
                          filledColor: Theme.of(context).primaryColor.withOpacity(0.15),
                        ),
                      ],
                    )),
                MyBoxWidget(
                  height: 30,
                ),
                TextBtnWidget(
                    name: 'Login',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        dbHelper.getLogin(password: passwordController.text, contact: contactController.text).then((value) {
                          if (value != null) {
                            context.offAll(const NewsFeedPage());
                          }
                        });
                      }
                    }),
                MyBoxWidget(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not Register? '),
                    InkWell(
                      onTap: () {
                        context.to(const RegisterPage());
                      },
                      child: const Text(
                        'Create an account',
                        style: TextStyle(decoration: TextDecoration.underline, color: MyTheme.burntSiennaColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    contactController.dispose();
    super.dispose();
  }
}

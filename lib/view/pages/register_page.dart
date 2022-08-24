import 'package:content_bytes/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../constants/constants.dart';
import '../../models/user_object.dart';
import '../../utils/database_helper.dart';
import '../../utils/database_services.dart';
import '../../utils/validator.dart';
import '../widgets/card_widget.dart';
import '../widgets/icon_button_widget.dart';
import '../widgets/my_box_widget.dart';
import '../widgets/my_theme.dart';
import '../widgets/text_button_widget.dart';
import '../widgets/text_field_widget.dart';
import 'contents_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leading: IconButtonWidget(
            iconData: Icons.arrow_back_sharp,
            onTap: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SingleChildScrollView(
        child: CardWidget(
          backgroundColor: MyTheme.burntSiennaColor,
          pb: 20,
          child: Column(
            children: [
              MyBoxWidget(),
              const Text(
                'Registration',
                style: TextStyle(fontSize: 21),
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
                        name: 'Mail or Phone Number',
                        filledColor: Theme.of(context).primaryColor.withOpacity(0.15),
                        validator: () {
                          String? validateText = Validation.emailPhone(contactController.text);
                          return validateText;
                        },
                      ),
                      MyBoxWidget(),
                      TextFieldWidget(
                        controller: passwordController,
                        name: 'Password',
                        isObscured: true,
                        filledColor: Theme.of(context).primaryColor.withOpacity(0.15),
                        validator: () {
                          if (passwordController.text != confirmPasswordController.text) {
                            return 'Passwords are not same.';
                          } else if (confirmPasswordController.text.length < 8) {
                            return 'Password must be minimum 8 characters.';
                          }
                        },
                      ),
                      MyBoxWidget(),
                      TextFieldWidget(
                        controller: confirmPasswordController,
                        name: 'Confirm Password',
                        isObscured: true,
                        filledColor: Theme.of(context).primaryColor.withOpacity(0.15),
                        validator: () {
                          if (passwordController.text != confirmPasswordController.text) {
                            return 'Passwords are not same.';
                          } else if (confirmPasswordController.text.length < 8) {
                            return 'Confirm Password must be minimum 8 characters.';
                          }
                        },
                      ),
                    ],
                  )),
              MyBoxWidget(
                height: 30,
              ),
              TextBtnWidget(
                  name: 'Register',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      UserObject object = UserObject(contact: contactController.text, password: passwordController.text);
                      DatabaseServices().insertItem(object.toMap(), tableUser).then((value) {
                        if (value != null) {
                          passwordController.clear();
                          confirmPasswordController.clear();
                          contactController.clear();
                          context.offAll(NewsFeedPage());
                        }
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Successfully Register!')),
                      );
                    }
                  }),
              MyBoxWidget(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  context.offAll(NewsFeedPage());
                },
                child: const Text(
                  'Continue without register',
                  textAlign: TextAlign.center,
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    confirmPasswordController.dispose();
    passwordController.dispose();
    contactController.dispose();
    super.dispose();
  }
}

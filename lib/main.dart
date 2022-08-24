import 'package:content_bytes/view/pages/login_page.dart';
import 'package:content_bytes/view/widgets/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
     MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _myTheme = MyTheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _myTheme.myThemeData(),
      home: LoginPage(), //LoginPage(),
    );
  }
}

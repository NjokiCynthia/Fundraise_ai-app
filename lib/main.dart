import 'package:flexfund_app/authentication/login.dart';
import 'package:flexfund_app/theme/color_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexFund',
      theme: FlexFundTheme.theme,
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

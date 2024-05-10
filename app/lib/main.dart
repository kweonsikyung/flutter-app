import 'package:flutter/material.dart';
import 'package:app/screen/screens_index.dart';
import 'package:app/screen/screens_setting.dart';
import 'package:app/screen/screens_splash.dart';
import 'package:app/screen/screens_main.dart';
import 'package:app/screen/screens_account.dart';
import 'package:app/screen/screens_feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clip Story',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/index': (context) => IndexScreen(),
        '/setting': (context) => SettingScreen(),
        '/main': (context) => MainScreen(),
        '/feed': (context) => FeedScreen(),
        '/account': (context) => AccountScreen(),
      },
      initialRoute: '/',
    );
  }
}

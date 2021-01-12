import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toadstool/screens/basketscreen.dart';
import 'package:toadstool/screens/detailsscreen.dart';
import 'package:toadstool/screens/gardenscreen.dart';
import 'package:toadstool/screens/homepage.dart';
import 'package:toadstool/screens/listplant.dart';
import 'package:toadstool/screens/welcomescreen.dart';
import 'screens/signup.dart';
import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffffc371),
        accentColor: Color(0xffff5f6d),
        canvasColor: Color(0xff282828),
        primaryColorDark: Color(0xff3f3f3f),

        // splashColor: Color(0xff2c2c2c),

        // iconTheme: IconThemeData(color: Color(0xff5f5f5f)),
        fontFamily: 'Montserrat',
      ),
      home: HomePage(),
    );
  }
}
// LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [Color(0xffffc371), Color(0xffff5f6d)]),

//0xff898989

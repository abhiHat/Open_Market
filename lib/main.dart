import 'package:flutter/material.dart';
import 'package:open_market/SaleApp/Screens/SaleHome.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'open market',
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.purple),
      home: AppStart(),
    );
  }
}

class AppStart extends StatefulWidget {
  @override
  _AppStartState createState() => _AppStartState();
}

class _AppStartState extends State<AppStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SplashScreen(
             //Linear gradient for Splash Screen
            navigateAfterSeconds: new SaleHome(),
            image: Image(image: AssetImage('assets/images/cart.png')),
            seconds: 6,
            photoSize: 60.0,
            title: Text('Open Market'),)
      ),
    );
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:open_market/AuthApp/Screens/user_info.dart';
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
  void initState() {
      super.initState();
      Firebase.initializeApp().whenComplete((){
        print("Firebase initialized....!!");

        // User user = FirebaseAuth.instance.currentUser;
        // if(user != null){
        //   Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => UserInfoScreen(
        //       user: user,
        //     ))
        //   );
        // }

        setState(() {

        });
      });
  }


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


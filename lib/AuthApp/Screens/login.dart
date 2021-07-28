import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_market/AuthApp/Screens/signup.dart';
import 'package:open_market/AuthApp/Screens/user_info.dart';
import 'package:open_market/utils/authentication.dart';
import 'package:open_market/utils/updateUserToServer.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isSigningIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User user = FirebaseAuth.instance.currentUser;
    if(user != null){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => UserInfoScreen(
          user: user,
        ))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 40),
                padding: EdgeInsets.only(top: 60, bottom: 25),
                decoration: BoxDecoration(
                  // border: Border.all(width: 0.4),
                    color: Colors.cyan[50],
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.cyan[200],
                        border: Border.all(width: 0.1),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black54,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'User Name / Email',
                            fillColor: Colors.grey,
                            focusColor: Colors.black54,
                            border: InputBorder.none,
                            icon: Icon(Icons.person, color: Colors.black54,)
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.cyan[200],
                        border: Border.all(width: 0.1),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black54,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: InputBorder.none,
                            icon: Icon(Icons.lock, color: Colors.black54,)
                        ),
                      ),
                    ),

                    Container(
                      // padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.cyan[300],
                        border: Border.all(width: 0.1),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: MaterialButton(onPressed: (){},
                      child: Text('Login',style: TextStyle(fontSize: 20),),),
                    )

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 25, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(child: Text("Forget Password?")),
                    SizedBox(width: 20,),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                        },
                        child: Container(child: Text("Don't have an account? \nSignup Here", textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),)))
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 25,),
              Center(
                child: _isSigningIn
                  ?CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                  :OutlinedButton(
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ))
                  ),
                  onPressed: () async {

                    setState(() {
                      _isSigningIn = true;
                    });

                    User user = await Authentication.signInWithGoogle(
                      context : context
                    );

                    if(user.email != null){
                      var usr = FirebaseAuth.instance.currentUser;
                      updateUserToServer(usr);
                      print(user.email);
                    }

                    setState(() {
                      _isSigningIn = false;
                    });

                    if (user != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => UserInfoScreen(
                            user: user,
                          ),
                        ),
                      );
                    }

                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/google_logo.png"),
                          height: 35,
                        ),
                        Padding(padding: EdgeInsets.only(left: 10),
                          child: Text('Sign in with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600
                          ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

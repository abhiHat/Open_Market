import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_market/AuthApp/Models/UserModel.dart';
import 'package:open_market/utils/signUp.dart';
import 'package:toast/toast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController fnamecntrl = new TextEditingController();
  TextEditingController lnamecntrl = new TextEditingController();
  TextEditingController emailcntrl = new TextEditingController();
  TextEditingController cnocntrl = new TextEditingController();
  TextEditingController addcntrl = new TextEditingController();
  TextEditingController citycntrl = new TextEditingController();
  TextEditingController pincntrl = new TextEditingController();
  TextEditingController statecntrl = new TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100,),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        controller: fnamecntrl,
                        decoration: InputDecoration(
                          labelText: " First Name",
                          contentPadding: EdgeInsets.only(left: 20, top: 5),
                          labelStyle: TextStyle(
                          color: Colors.black54
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        controller: lnamecntrl,
                        decoration: InputDecoration(
                            labelText: " Last Name",
                          contentPadding: EdgeInsets.only(left: 20, top: 5),
                            labelStyle: TextStyle(
                                color: Colors.black54
                            ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        controller: emailcntrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: " Email",
                          contentPadding: EdgeInsets.only(left: 20, top: 5),
                            labelStyle: TextStyle(
                                color: Colors.black54
                            ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        controller: cnocntrl,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: " Contact Number",
                          contentPadding: EdgeInsets.only(left: 20, top: 5),
                            labelStyle: TextStyle(
                                color: Colors.black54
                            ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        controller: addcntrl,
                        decoration: InputDecoration(
                            labelText: " Address",
                          contentPadding: EdgeInsets.only(left: 20, top: 5),
                            labelStyle: TextStyle(
                                color: Colors.black54
                            ),
                            border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        controller: citycntrl,
                        decoration: InputDecoration(
                            labelText: " City",
                          contentPadding: EdgeInsets.only(left: 20, top: 5),
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                                color: Colors.black54
                            ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.2),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        controller: pincntrl,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: InputDecoration(
                            labelText: " Pincode",
                            contentPadding: EdgeInsets.only(left: 20, top: 5),
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                                color: Colors.black54
                            )
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        controller: statecntrl,
                        decoration: InputDecoration(
                          labelText: " State",
                            contentPadding: EdgeInsets.only(left: 20, top: 5),
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                                color: Colors.black54
                            )
                        ),
                      ),
                    ),

                    Divider(),

                    Container(
                        padding: const EdgeInsets.all(2.0),
                        margin: EdgeInsets.all(4),
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.2),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: MaterialButton(
                            onPressed: () {
                              
                              print(lnamecntrl.text);
                              validateForm();
                            },
                            child: Text("SignUp")))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateForm() {
    if(fnamecntrl.text.isEmpty || lnamecntrl.text.isEmpty || emailcntrl.text.isEmpty || cnocntrl.text.isEmpty || citycntrl.text.isEmpty || pincntrl.text.isEmpty || statecntrl.text.isEmpty || addcntrl.text.isEmpty ){
      Toast.show("Please Fill the Information", context,duration: Toast.LENGTH_LONG);
    }else{
      UserModel um = new UserModel(null, fnamecntrl.text, lnamecntrl.text, emailcntrl.text, cnocntrl.text, addcntrl.text, citycntrl.text, statecntrl.text, pincntrl.text, DateTime.now().toString(), DateTime.now().toString());
      signUp(um, context);

    }
  }
}

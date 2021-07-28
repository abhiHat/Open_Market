
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_market/AuthApp/Models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

signUp(UserModel user, BuildContext context) async{

  var fname = user.fname;
  var lname = user.lname;
  var cno = user.cno;
  var email = user.email;
  var add = user.address;
  var pin = user.pincode;
  var city = user.city;
  var state = user.state;

  var response = await http.post(Uri.parse("http://192.168.43.175:8000/ci/om/public/usercontroller"),body: {
    "fname": fname,
    "lname":lname,
    "email":email,
    "cno":cno,
    "address":add,
    "pincode":pin,
    "city":city,
    "state":state
  });

  var op = json.decode(response.body);
  print(op.toString());

  if(op['status_code'] == 123){
    Toast.show("Account Exist with given Email Id",context ,duration: Toast.LENGTH_LONG, backgroundColor: Colors.red);
  }else if(response.statusCode == 201){
    Toast.show(op['message'],context ,duration: Toast.LENGTH_LONG, backgroundColor: Colors.red);
  }else{
    Toast.show("Account Created Successfully", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER, backgroundColor: Colors.green[800], backgroundRadius: 12);
    Navigator.pop(context);
  }



}
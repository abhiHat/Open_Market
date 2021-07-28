import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

 updateUserToServer(User usr) async{
   var fname = usr.displayName.toString();
   var email = usr.email.toString();
   var cno = usr.phoneNumber.toString();
   var img_link = usr.photoURL.toString();

   print(fname + email + cno + img_link);

   var response =await http.post(Uri.parse("http://192.168.43.175:8000/ci/om/public/usercontroller"),body:{
     "fname" : fname,
     "email" : email,
     "cno" : (cno != null) ? cno : " ",
     "img_link" : img_link
   } );

   var op = json.decode(response.body);
   // print(op);

}
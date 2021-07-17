import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<String> selectDate(BuildContext context) async{

  DateTime sDate = DateTime.now();
  DateTime selDate ;

  DateTime val = showDatePicker(
      context: context,
      initialDate: DateTime(1980),
      lastDate: sDate,
      firstDate: sDate,
  ) as DateTime;
  if(val != null && val != DateTime.now()){
    return val.toString();
  }else{
    return DateTime.now().toString();
  }

  // return selDate;
}
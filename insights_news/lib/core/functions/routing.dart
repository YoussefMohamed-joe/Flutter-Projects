import 'package:flutter/material.dart';

navigateTo(context,newView){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> newView));
}

navigateToWithReplacment(context,newView){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> newView));
}
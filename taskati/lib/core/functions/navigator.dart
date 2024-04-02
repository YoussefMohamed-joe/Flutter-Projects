import 'package:flutter/material.dart';

navigateTo(context,Widget nextScreen){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextScreen));
}

navigateTowithReplacment(context,Widget nextScreen){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nextScreen));
}
  navigateToPop(context){
  Navigator.of(context).pop();
}
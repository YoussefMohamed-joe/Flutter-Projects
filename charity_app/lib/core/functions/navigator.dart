import 'package:charity_app/core/widgets/nav_bar_view.dart';
import 'package:flutter/material.dart';

navigateTo(context, Widget nextScreen) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => nextScreen));
}

navigateTowithReplacment(context, Widget nextScreen) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => nextScreen));
}

navigateToPop(context) {
  Navigator.of(context).pop();
}

navigateUntilWithReplacment(context, Widget nextScreen) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => nextScreen),
      (Route<dynamic> route) => false);
}


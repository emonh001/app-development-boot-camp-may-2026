import 'package:flutter/material.dart';

class ShowSnackbar {

  static void showMessage(BuildContext context, String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

}
import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle = false, String titleText}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      isAppTitle ? 'KalyxChat' : titleText,
      style: TextStyle(
        fontFamily: isAppTitle ? 'Signatra' : '',
        fontSize: isAppTitle ? 50.0 : 22,
        color: Colors.white,
      ),
    ),
    backgroundColor: Theme.of(context).accentColor,
  );
}

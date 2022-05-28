import 'package:flutter/material.dart';

Widget loading() {
  return Container(
    height: 200,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget error() {
  return Container(
    height: 200,
    child: Center(
      child: Text('error'),
    ),
  );
}

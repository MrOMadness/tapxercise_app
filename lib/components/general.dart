import 'package:flutter/material.dart';

Widget loading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget error() {
  return Center(
    child: Text('error'),
  );
}

import 'package:flutter/material.dart';

class LeaderboardBox extends StatefulWidget {
  final List actions;
  LeaderboardBox({Key key, this.actions});

  @override
  _LeaderboardBoxState createState() => _LeaderboardBoxState();
}

class _LeaderboardBoxState extends State<LeaderboardBox> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('tes'));
  }
}

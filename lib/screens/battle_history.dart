import 'package:flutter/material.dart';

class BattleHistoryScreen extends StatefulWidget {
  const BattleHistoryScreen({Key key}) : super(key: key);

  @override
  State<BattleHistoryScreen> createState() => _BattleHistoryScreenState();
}

class _BattleHistoryScreenState extends State<BattleHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Battle History')),
    );
  }
}

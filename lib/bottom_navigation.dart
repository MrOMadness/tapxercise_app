import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tapxercise/screens/battle_history.dart';
import 'package:tapxercise/screens/change_player.dart';
import 'package:tapxercise/screens/solo_leaderboard.dart';

class ButtomNavigation extends StatefulWidget {
  const ButtomNavigation({Key key}) : super(key: key);

  @override
  State<ButtomNavigation> createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<ButtomNavigation> {
  // Selected index of botnav | 0 is home, 1 is history
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: [SoloLeaderboardScreen(), BattleHistoryScreen()]
            .elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePlayerScreen()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        // Library from AnimatedBottomNavigationBar
        icons: iconList,
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  static const iconList = [
    Icons.leaderboard,
    Icons.add_moderator_rounded
  ]; // TODO: ganti icon
}

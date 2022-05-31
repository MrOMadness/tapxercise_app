import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapxercise/bloc/leaderboard_bloc.dart';
import 'package:tapxercise/bottom_navigation.dart';
import 'package:tapxercise/utils/api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await NssProductions.getAllUsers();

  runApp(const MyApp()); // Run the app
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LeaderboardBloc>(
      create: (context) => LeaderboardBloc(),
      child: MaterialApp(
        title: 'Tapxercise', // Title of the app
        theme: ThemeData(
          primarySwatch: Colors.lightBlue, // Primary theme color
        ),
        home: ButtomNavigation(),
      ),
    );
  }
}

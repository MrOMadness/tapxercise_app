import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapxercise/blocs/leaderboard_bloc.dart';
import 'package:tapxercise/templates/general.dart';

class SoloLeaderboardScreen extends StatefulWidget {
  const SoloLeaderboardScreen({Key key}) : super(key: key);

  @override
  State<SoloLeaderboardScreen> createState() => _SoloLeaderboardScreenState();
}

class _SoloLeaderboardScreenState extends State<SoloLeaderboardScreen> {
  @override
  void initState() {
    BlocProvider.of<LeaderboardBloc>(context).add(GetLeaderboard());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
          builder: (context, state) {
            // print(context);
            print('state:');
            print(state);
            if (state is LeaderboardLoading || state is LeaderboardInitial) {
              return loading();
            } else if (state is LeaderboardLoaded) {
              Container(
                child: Text('woow'),
              );
              // return _buildLoaded(state.banner);
            }
            return error();
          },
        ),
      ),
    );
  }
}

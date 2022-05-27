import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapxercise/blocs/leaderboard_bloc.dart';

class SoloLeaderboardScreen extends StatefulWidget {
  const SoloLeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<SoloLeaderboardScreen> createState() => _SoloLeaderboardScreenState();
}

class _SoloLeaderboardScreenState extends State<SoloLeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<LeaderboardEvent, LeaderboardState>(
          builder: (context, state) {
            if (state is BannerDetailLoading ||
                state is InitialBannerDetailState) {
              return _buildLoading();
            } else if (state is BannerDetailLoaded) {
              return _buildLoaded(state.banner);
            }
            return _buildLoading();
          },
        ),
      ),
    );
  }
}

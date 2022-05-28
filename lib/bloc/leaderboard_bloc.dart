import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tapxercise/models/leaderboard_model.dart';
import 'package:tapxercise/utils/api.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc() : super(LeaderboardInitial());

  @override
  Stream<LeaderboardState> mapEventToState(
    LeaderboardEvent event,
  ) async* {
    if (event is GetLeaderboard) {
      bool loading = event.loading ?? false;
      if (loading) {
        yield LeaderboardLoading();
      }
      sleep(Duration(seconds: 2));
      // yield LeaderboardLoading();
      try {
        yield LeaderboardLoaded(await NssProductions.getAllUsers());
      } catch (e) {
        yield LeaderboardError();
      }
    }
  }
}

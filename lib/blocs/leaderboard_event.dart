part of 'leaderboard_bloc.dart';

abstract class LeaderboardEvent extends Equatable {
  const LeaderboardEvent();
}

class GetLeaderboard extends LeaderboardEvent {
  GetLeaderboard();

  @override
  List<Object> get props => [];
}

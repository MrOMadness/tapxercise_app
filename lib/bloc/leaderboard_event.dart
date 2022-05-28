part of 'leaderboard_bloc.dart';

abstract class LeaderboardEvent extends Equatable {
  const LeaderboardEvent();

  @override
  List<Object> get props => [];
}

class GetLeaderboard extends LeaderboardEvent {
  final bool loading;

  GetLeaderboard({this.loading});
}

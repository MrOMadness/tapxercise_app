part of 'leaderboard_bloc.dart';

abstract class LeaderboardEvent extends Equatable {
  const LeaderboardEvent();
}

class GetLeaderboard extends LeaderboardEvent {
  final String bannerID;
  final String type;
  const GetLeaderboard(this.bannerID, this.type);

  @override
  List<Object> get props => [bannerID, type];
}

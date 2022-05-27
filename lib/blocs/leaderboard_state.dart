part of 'leaderboard_bloc.dart';

abstract class LeaderboardState extends Equatable {
  const LeaderboardState();
}

class InitialLeaderboardState extends LeaderboardState {
  @override
  List<Object> get props => [];
}

class LeaderboardInitial extends LeaderboardState {
  const LeaderboardInitial();
  @override
  List<Object> get props => [];
}

class LeaderboardLoadingState extends LeaderboardState {
  @override
  List<Object> get props => [];
}

class LeaderboardError extends LeaderboardState {
  final String message;
  const LeaderboardError(this.message);
  @override
  List<Object> get props => [message];
}

class LeaderboardLoaded extends LeaderboardState {
  final Leaderboard leaderboard;
  const LeaderboardLoaded(this.leaderboard);
  // @override
  List<Object> get props => [];
}

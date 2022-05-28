part of 'leaderboard_bloc.dart';

abstract class LeaderboardState extends Equatable {
  const LeaderboardState();

  @override
  List<Object> get props => [];
}

class LeaderboardInitial extends LeaderboardState {}

class LeaderboardLoaded extends LeaderboardState {
  final List<Leaderboard> model;
  const LeaderboardLoaded(this.model);
  @override
  List<Object> get props => [model];
}

class LeaderboardLoading extends LeaderboardState {}

class LeaderboardError extends LeaderboardState {}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tapxercise/models/leaderboard_model.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc() : super(LeaderboardInitial()) {
    on<LeaderboardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

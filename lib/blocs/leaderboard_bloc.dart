import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tapxercise/utils/api.dart';
import 'package:meta/meta.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc() : super(InitialLeaderboard()) {
    // on<LeaderboardEvent>((event, emit) {
    //   if (event is GetLeaderboard) {
    //     emit(LeaderboardLoading());
    //     emit(LeaderboardLoaded('tes'));
    //   }
    //   // TODO: implement event handler
    // });
      @override
      Stream<LeaderboardState> mapEventToState(
        LeaderboardEvent event,
      ) async* {
        if (event is GetLeaderboard) {
          print('tes');
          try {
            yield LeaderboardLoading();
            Response response = await NssProductions.getAllUsers();
            print(response.data);
            // yield LeaderboardLoaded(response);

            // if (response.statusCode == 200) {
            //   yield PaperIdLoaded(PaperIdLimitModel.fromJson(callapi.data));
            // }
            // if(response.statusCode == 500){
            //   yield LeaderboardLoaded('lea');
            // }
          } catch (e) {
            yield LeaderboardError(e.toString());
          }
        }
      }
      // on<LeaderboardEvent>((event, emit) {
      //   // TODO: implement event handler
      // });
  }
}

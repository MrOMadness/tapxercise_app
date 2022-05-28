import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'battle_history_event.dart';
part 'battle_history_state.dart';

class BattleHistoryBloc extends Bloc<BattleHistoryEvent, BattleHistoryState> {
  BattleHistoryBloc() : super(BattleHistoryInitial()) {
    on<BattleHistoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

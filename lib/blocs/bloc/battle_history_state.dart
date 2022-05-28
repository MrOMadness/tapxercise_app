part of 'battle_history_bloc.dart';

abstract class BattleHistoryState extends Equatable {
  const BattleHistoryState();
  
  @override
  List<Object> get props => [];
}

class BattleHistoryInitial extends BattleHistoryState {}

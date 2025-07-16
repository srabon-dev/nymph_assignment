part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
}

class HistoryUpdateState extends HistoryState {
  final List<HistoryEntities> historyList;

  const HistoryUpdateState({required this.historyList});

  @override
  List<Object> get props => [historyList];
}

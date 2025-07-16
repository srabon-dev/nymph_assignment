part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
}

class HistoryLoadEvent extends HistoryEvent {
  const HistoryLoadEvent();

  @override
  List<Object?> get props => [];
}

class HistoryAddEvent extends HistoryEvent{
  final String text;
  final int count;

  const HistoryAddEvent({required this.text, required this.count});

  @override
  List<Object?> get props => [text, count];
}

class HistoryDeleteEvent extends HistoryEvent{
  final int index;

  const HistoryDeleteEvent({required this.index});

  @override
  List<Object?> get props => [index];
}
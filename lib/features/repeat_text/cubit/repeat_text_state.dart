part of 'repeat_text_cubit.dart';

abstract class RepeatTextState extends Equatable {
  const RepeatTextState();
}

class RepeatTextInitialState extends RepeatTextState {
  final String text;
  final int index;

  const RepeatTextInitialState({required this.text, required this.index});

  @override
  List<Object> get props => [text, index];
}

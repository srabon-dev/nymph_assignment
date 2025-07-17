part of 'repeat_text_cubit.dart';

abstract class RepeatTextState extends Equatable {
  const RepeatTextState();
}

class RepeatTextUpdatedState extends RepeatTextState {
  final String text;
  final String font;
  final int count;
  final List<String> availableFonts;

  const RepeatTextUpdatedState({
    required this.text,
    required this.font,
    required this.count,
    this.availableFonts  = const [],
  });

  @override
  List<Object> get props => [text, font, count, availableFonts];
}

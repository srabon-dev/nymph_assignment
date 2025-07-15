import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'repeat_text_event.dart';
part 'repeat_text_state.dart';

class RepeatTextBloc extends Bloc<RepeatTextEvent, RepeatTextState> {
  RepeatTextBloc() : super(RepeatTextInitial()) {
    on<RepeatTextEvent>((event, emit) {

    });
  }
}

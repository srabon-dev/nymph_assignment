import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'repeat_text_state.dart';

class RepeatTextCubit extends Cubit<RepeatTextState> {
  RepeatTextCubit() : super(const RepeatTextInitialState(text: '', index: 0));

  void updateRepeatText({required String text, required int index}){

    print("updateRepeatText");
    emit(RepeatTextInitialState(text: text, index: index));
  }
}

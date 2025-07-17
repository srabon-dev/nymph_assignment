import '../../../core/core_export.dart';

part 'repeat_text_state.dart';

class RepeatTextCubit extends Cubit<RepeatTextState> {
  RepeatTextCubit()
    : super(
        const RepeatTextUpdatedState(
          text: '',
          count: 0,
          font: AppConstant.defaultFont,
        ),
      ) {
    _loadFonts();
  }

  Future<void> _loadFonts() async {
    try {
      final fonts = await getFontsInBackground();
      final currentState = state;
      if (currentState is RepeatTextUpdatedState) {
        emit(
          RepeatTextUpdatedState(
            text: currentState.text,
            count: currentState.count,
            font: currentState.font,
            availableFonts: fonts,
          ),
        );
      }
    } catch (e) {
      debugPrint('Failed to load fonts: $e');
    }
  }

  void updateRepeatText({
    required String text,
    required String font,
    required int index,
  }) {

    final List<String> currentFonts = (state is RepeatTextUpdatedState) ?
    (state as RepeatTextUpdatedState).availableFonts : [];

    emit(
      RepeatTextUpdatedState(
        text: text,
        count: index,
        font: font,
        availableFonts: currentFonts,
      ),
    );
  }
}

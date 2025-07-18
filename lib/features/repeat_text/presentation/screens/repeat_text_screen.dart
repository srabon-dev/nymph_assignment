import '../../../../core/core_export.dart';
import '../../../history/bloc/history_bloc.dart';
import '../../cubit/repeat_text_cubit.dart';
import '../widgets/repeat_text_app_bar.dart';
import '../widgets/repeat_text_inputs_action_widget.dart';
import '../widgets/repeat_text_list_view.dart';
import '../widgets/repeat_text_share_section.dart';

class RepeatTextScreen extends StatefulWidget {
  const RepeatTextScreen({super.key});

  @override
  State<RepeatTextScreen> createState() => _RepeatTextScreenState();
}

class _RepeatTextScreenState extends State<RepeatTextScreen> {
  final TextEditingController repeatText = TextEditingController();
  final TextEditingController repeatNumber = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<String> selectedFont = ValueNotifier(
    AppConstant.defaultFont,
  );

  @override
  void dispose() {
    repeatText.dispose();
    repeatNumber.dispose();
    selectedFont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RepeatTextAppBar(),
      body: SafeArea(
        top: false,
        child: BlocBuilder<RepeatTextCubit, RepeatTextState>(
          buildWhen: (previous, current) {
            if (previous is RepeatTextUpdatedState && current is RepeatTextUpdatedState) {
              return previous.availableFonts != current.availableFonts;
            }
            return current is RepeatTextUpdatedState;
          },
          builder: (context, state) {

            debugPrint("Build availableFonts");

            List<String> fonts = [];
            selectedFont.value = AppConstant.defaultFont;

            if (state is RepeatTextUpdatedState) {
              fonts = state.availableFonts;
              selectedFont.value = state.font;
              if (fonts.isNotEmpty && !fonts.contains(selectedFont.value)) {
                selectedFont.value = fonts.first;
              }
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Form(
                      key: _formKey,
                      child: RepeatTextInputsActionWidget(
                        repeatNumber: repeatNumber,
                        repeatText: repeatText,
                        availableFonts: fonts,
                        selectedFont: selectedFont,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            debugPrint("currentFont ${selectedFont.value}");
                            context.read<HistoryBloc>().add(
                              HistoryAddEvent(
                                text: repeatText.text,
                                count: int.tryParse(repeatNumber.text) ?? 0,
                              ),
                            );
                            context.read<RepeatTextCubit>().updateRepeatText(
                              text: repeatText.text,
                              index: int.tryParse(repeatNumber.text) ?? 0,
                              font: selectedFont.value,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: RepeatTextShareSection(),
                  ),
                  const RepeatTextListView(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

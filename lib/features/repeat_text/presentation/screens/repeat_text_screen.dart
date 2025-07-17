import '../../../../core/core_export.dart';
import '../../../history/bloc/history_bloc.dart';
import '../../../history/presentation/screens/history_screen.dart';
import '../../cubit/repeat_text_cubit.dart';
import '../widgets/repeat_text_inputs_action_widget.dart';
import '../widgets/repeat_text_list_view.dart';

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

  List<String> availableFonts = [];

  @override
  void initState() {
    super.initState();
    getFontsInBackground().then((fonts) {
      availableFonts = fonts;
      debugPrint(availableFonts.length.toString());
      selectedFont.value = availableFonts.first;
    }).catchError((e){
      debugPrint(e.toString());
    });
  }

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
      appBar: AppBar(
        title: const Text("Repeat Text"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: BlocBuilder<RepeatTextCubit, RepeatTextState>(
        buildWhen: (previous, current) {
          if (previous is RepeatTextUpdatedState && current is RepeatTextUpdatedState) {
            return previous.availableFonts != current.availableFonts;
          }
          return current is RepeatTextUpdatedState;
        },
        builder: (context, state) {

          debugPrint("Build availableFonts");

          List<String> fonts = [];
          String currentFont = AppConstant.defaultFont;

          if (state is RepeatTextUpdatedState) {
            fonts = state.availableFonts;
            currentFont = state.font;
            if (fonts.isNotEmpty && !fonts.contains(currentFont)) {
              currentFont = fonts.first;
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
                      selectedFont: ValueNotifier(currentFont),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<HistoryBloc>().add(
                            HistoryAddEvent(
                              text: repeatText.text,
                              count: int.tryParse(repeatNumber.text) ?? 0,
                            ),
                          );
                          context.read<RepeatTextCubit>().updateRepeatText(
                            text: repeatText.text,
                            index: int.tryParse(repeatNumber.text) ?? 0,
                            font: currentFont,
                          );
                        }
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Repeat Text View",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      BlocBuilder<RepeatTextCubit, RepeatTextState>(
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () async {
                              if (state is RepeatTextUpdatedState && state.text.trim().isNotEmpty) {
                                await shareRepeatText(text: state.text);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("No text share"),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.share),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const RepeatTextListView(),
              ],
            ),
          );
        },
      ),
    );
  }
}

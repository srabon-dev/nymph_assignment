import 'package:nymph_assignment/features/history/presentation/screens/history_screen.dart';

import '../../../../core/core_export.dart';
import '../../../history/bloc/history_bloc.dart';
import '../../cubit/repeat_text_cubit.dart';
import '../widgets/repeat_text_card.dart';
import '../widgets/repeat_text_inputs_action_widget.dart';

class RepeatTextScreen extends StatefulWidget {
  const RepeatTextScreen({super.key});

  @override
  State<RepeatTextScreen> createState() => _RepeatTextScreenState();
}

class _RepeatTextScreenState extends State<RepeatTextScreen> {
  final TextEditingController repeatText = TextEditingController();
  final TextEditingController repeatNumber = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    repeatText.dispose();
    repeatNumber.dispose();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: RepeatTextInputsActionWidget(
                  repeatNumber: repeatNumber,
                  repeatText: repeatText,
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
                      );
                    }
                  },
                ),
              ),
            ),
            BlocBuilder<RepeatTextCubit, RepeatTextState>(
              builder: (context, state) {

                print("Build Repeat Text");

                if (state is RepeatTextInitialState) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((_, index) {
                      return RepeatTextCard(
                        index: index,
                        text: state.text,
                      );
                    }, childCount: state.index),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate((_, index) {
                    return RepeatTextCard(
                      index: index,
                      text: "",
                    );
                  }, childCount: 0),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

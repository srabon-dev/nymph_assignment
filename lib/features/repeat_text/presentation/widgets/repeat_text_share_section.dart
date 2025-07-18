import '../../../../core/core_export.dart';
import '../../cubit/repeat_text_cubit.dart';

class RepeatTextShareSection extends StatelessWidget {
  const RepeatTextShareSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
import '../../../../core/core_export.dart';
import '../../cubit/repeat_text_cubit.dart';
import 'repeat_text_card.dart';

class RepeatTextListView extends StatelessWidget {
  const RepeatTextListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepeatTextCubit, RepeatTextState>(
      builder: (context, state) {
        debugPrint("Build Repeat Text");

        if (state is RepeatTextUpdatedState) {
          if (state.count == 0) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "No data found",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate((_, index) {
              debugPrint("Build Repeat Text Item $index");
              return RepeatTextCard(
                index: index,
                text: state.text,
                font: state.font,
              );
            }, childCount: state.count),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate((_, index) {
            return RepeatTextCard(
              index: index,
              text: "",
              font: AppConstant.defaultFont,
            );
          }, childCount: 0),
        );
      },
    );
  }
}

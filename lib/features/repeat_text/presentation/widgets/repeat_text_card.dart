import '../../../../core/core_export.dart';

class RepeatTextCard extends StatelessWidget {
  const RepeatTextCard({super.key, required this.index, required this.text});

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          spacing: 8,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Text(
                "${index + 1}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(
              child: Text(
                text,
                maxLines: 3,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

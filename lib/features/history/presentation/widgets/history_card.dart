import '../../../../core/core_export.dart';
import '../../domain/entities/history_entities.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.item, required this.index});

  final HistoryEntities item;
  final int index;

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
            Expanded(
              child: Text(
                item.text,
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
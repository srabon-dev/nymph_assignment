import '../../../../core/core_export.dart';
import '../../../history/presentation/screens/history_screen.dart';

class RepeatTextAppBar extends StatelessWidget implements PreferredSizeWidget{
  const RepeatTextAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

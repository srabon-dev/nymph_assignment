import '../../../../core/core_export.dart';
import '../../bloc/history_bloc.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HistoryBloc>().add(const HistoryLoadEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History"), centerTitle: true),
      body: SafeArea(
        top: false,
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            if (state is HistoryUpdateState) {
              final list = state.historyList.reversed.toList();

              debugPrint("Build");

              if (list.isEmpty) {
                return const Center(child: Text("No data found"));
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];

                  debugPrint("Item Build $index");

                  return HistoryCard(item: item, index: index);
                },
              );
            }
            return const Center(child: Text("No data found"));
          },
        ),
      ),
    );
  }
}



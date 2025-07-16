import '../../../../core/core_export.dart';
import '../../bloc/history_bloc.dart';

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
      appBar: AppBar(
        title: const Text("History"),
        centerTitle: true,
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryUpdateState) {
            final list = state.historyList;

            print("Build");

            if(list.isEmpty){
              return const Center(child: Text("No data found"));
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];

                print("Item Build $index");

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
                        IconButton(
                          onPressed: (){
                            context.read<HistoryBloc>().add(
                              HistoryDeleteEvent(index: index),
                            );
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: Text("No data found"));
        },
      ),
    );
  }
}

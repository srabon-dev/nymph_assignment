import 'package:hive_flutter/hive_flutter.dart';
import 'package:nymph_assignment/features/history/data/repository/history_repository.dart';
import 'package:nymph_assignment/features/history/domain/usecase/add_history.dart';
import 'package:nymph_assignment/features/history/domain/usecase/delete_history.dart';
import 'package:nymph_assignment/features/history/domain/usecase/get_history.dart';
import 'app.dart';
import 'core/core_export.dart';
import 'features/history/bloc/history_bloc.dart';
import 'features/history/data/model/history_model.dart';
import 'features/repeat_text/cubit/repeat_text_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(HistoryModelAdapter());
  final historyBox = await Hive.openBox<HistoryModel>('historyBox');

  final historyLocalDataSource = HistoryLocalDataSourceImpl(historyBox);
  final historyRepository = HistoryRepository(historyLocalDataSource);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<RepeatTextCubit>(create: (_) => RepeatTextCubit()),
        BlocProvider<HistoryBloc>(create: (_) => HistoryBloc(
          getHistory: GetHistory(repository: historyRepository),
          addHistory: AddHistory(repository: historyRepository),
          deleteHistory: DeleteHistory(repository: historyRepository),
        )),
      ],
      child: const MyApp(),
    ),
  );
}

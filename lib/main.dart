import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'core/core_export.dart';
import 'features/history/data/model/history_model.dart';
import 'features/repeat_text/bloc/repeat_text_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(HistoryModelAdapter());
  await Hive.openBox<HistoryModel>('historyBox');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<RepeatTextBloc>(create: (_) => RepeatTextBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

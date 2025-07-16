import 'core/core_export.dart';
import 'features/repeat_text/presentation/screens/repeat_text_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nymph Assignment',
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.light,
      theme: lightTheme,

      home: const RepeatTextScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'data/services/local_storage_service.dart';
import 'presentation/providers/repository_provider.dart';
import 'presentation/providers/theme_provider.dart';
import 'presentation/screens/home_screen.dart';



/// Application entrypoint.
///
/// Initializes local storage (Hive + SharedPreferences) before starting
/// the app and injects the initialized `LocalStorageService` into the
/// Riverpod `localStorageServiceProvider` using an override.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local storage (Hive boxes + SharedPreferences)
  final localStorage = LocalStorageService();
  await localStorage.init();

  runApp(
    ProviderScope(
      overrides: [
        // Provide the initialized instance to the app
        localStorageServiceProvider.overrideWithValue(localStorage),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'GitHub Flutter Repos',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
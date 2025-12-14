import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/local_storage_service.dart';

// Theme Provider
final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  final localStorage = ref.watch(localStorageServiceProvider);
  return ThemeNotifier(localStorage);
});

class ThemeNotifier extends StateNotifier<bool> {
  final LocalStorageService _localStorageService;

  ThemeNotifier(this._localStorageService)
      : super(_localStorageService.getThemePreference());

  void toggleTheme() {
    state = !state;
    _localStorageService.saveThemePreference(state);
  }

  void setTheme(bool isDark) {
    state = isDark;
    _localStorageService.saveThemePreference(isDark);
  }
}

// Import this in repository_provider.dart file
//import '../../data/services/local_storage_service.dart';
import '../widgets/error_widget.dart';


final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});
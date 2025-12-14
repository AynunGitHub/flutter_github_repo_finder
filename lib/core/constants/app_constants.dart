class AppConstants {
  // API Configuration
  static const String baseUrl = 'https://api.github.com';
  static const String searchEndpoint = '/search/repositories';
  static const String searchQuery = 'flutter';
  static const int perPage = 50;
  
  // Local Storage Keys
  static const String repositoriesBoxName = 'repositories';
  static const String sortPreferenceKey = 'sort_preference';
  static const String themePreferenceKey = 'theme_preference';
  static const String lastFetchTimeKey = 'last_fetch_time';
  
  // Sort Options
  static const String sortByStars = 'stars';
  static const String sortByUpdated = 'updated';
  
  // Cache Duration
  static const Duration cacheValidDuration = Duration(hours: 1);
  
  // Error Messages
  static const String noInternetError = 'No internet connection. Showing cached data.';
  static const String apiError = 'Failed to fetch repositories. Please try again.';
  static const String noCachedDataError = 'No cached data available. Please connect to the internet.';
  static const String emptyResultsError = 'No repositories found.';
}
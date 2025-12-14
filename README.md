# 🚀 GitHub Flutter Repository Finder

A production-ready Flutter application that fetches and displays the top 50 most starred GitHub repositories for the keyword "Flutter" with full offline support, sorting capabilities, and a beautiful Material Design 3 UI.

---

## 📱 Features

### Core Features
- ✅ **GitHub API Integration**: Fetches top 50 Flutter repositories by stars
- ✅ **Offline Support**: Full offline functionality with local caching
- ✅ **Persistent Storage**: Data persists across app sessions using Hive
- ✅ **Dual Sorting**: Sort by stars or last updated date
- ✅ **Repository Details**: Comprehensive details page with owner info
- ✅ **Pull-to-Refresh**: Easily refresh data with swipe gesture
- ✅ **Connectivity Detection**: Automatic offline mode detection
- ✅ **Error Handling**: Graceful error handling with user-friendly messages

### Bonus Features
- 🎨 **Theme Support**: Light and Dark mode with persistent preference
- 🔄 **Smart Caching**: Cache validation with timestamp tracking
- 📊 **Rich Statistics**: Stars, forks, watchers, and issues count
- 🌐 **Browser Integration**: Open repositories directly in browser
- 📅 **Date Formatting**: Human-readable date formats (MM-DD-YYYY HH:MM)
- 🎯 **Material Design 3**: Modern, beautiful UI following Material Design guidelines

---

## 🏗️ Architecture

### Clean Architecture + MVVM
```
lib/
├── core/                    # Core utilities and configurations
│   ├── constants/          # App-wide constants
│   ├── theme/             # Theme configurations
│   └── utils/             # Utility functions (date formatting)
├── data/                   # Data layer
│   ├── models/            # Data models with Hive annotations
│   ├── repositories/      # Repository pattern implementation
│   └── services/          # API and local storage services
├── presentation/          # Presentation layer
│   ├── providers/        # Riverpod state management
│   └── screens/          # UI screens
└── widgets/              # Reusable widgets
```

### Key Design Patterns
- **Repository Pattern**: Abstracts data sources
- **Provider Pattern**: State management with Riverpod
- **Singleton Pattern**: Service instances
- **Factory Pattern**: Model creation from JSON
- **Adapter Pattern**: Hive type adapters

---

## 🛠️ Technologies Used

### State Management
- **Riverpod 2.4.9**: Robust state management with dependency injection

### Networking
- **http 1.1.2**: API requests
- **connectivity_plus 5.0.2**: Network connectivity detection

### Local Storage
- **Hive 2.2.3**: Fast, lightweight NoSQL database
- **SharedPreferences 2.2.2**: Simple key-value storage for preferences

### UI
- **cached_network_image 3.3.1**: Efficient image caching
- **intl 0.18.1**: Date formatting and internationalization
- **url_launcher 6.2.2**: Launch URLs in browser
- **Material Design 3**: Modern, accessible UI components

---

## 📦 Installation & Setup

### Prerequisites
- Flutter SDK 3.0.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code with Flutter extensions
- Git

### Step 1: Clone Repository
```bash
git clone https://github.com/yourusername/flutter_github_repo_finder.git
cd flutter_github_repo_finder
```

### Step 2: Install Dependencies
```bash
flutter pub get
```

### Step 3: Generate Hive Type Adapters
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This generates `lib/data/models/repository_model.g.dart`

### Step 4: Run the App
```bash
# Debug mode
flutter run

# Release mode
flutter run --release
```

### Step 5: Build APK (Optional)
```bash
# Release APK
flutter build apk --release

# Split APKs by ABI (smaller size)
flutter build apk --split-per-abi
```

APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`

---

## 🎯 How It Works

### Data Flow

1. **App Launch**
   - Initialize Hive database
   - Load preferences (theme, sort)
   - Check for cached data
   - Display cached data if available

2. **Fetch Repositories**
   - Check internet connectivity
   - If online: Fetch from GitHub API
   - If offline: Load from Hive cache
   - Save to cache for offline use
   - Apply sorting preference

3. **User Interactions**
   - Sort: Toggle between stars/updated
   - Refresh: Force fetch new data
   - Theme: Switch light/dark mode
   - Details: Navigate to repository details

4. **Offline Mode**
   - Automatic detection
   - Show offline indicator
   - Serve cached data
   - Prevent unnecessary API calls

### Sorting System

**Sort by Stars** (Default)
- Descending order by `stargazers_count`
- Most popular repositories first

**Sort by Updated**
- Descending order by `updated_at`
- Most recently updated first

Sorting preference persists across app sessions using SharedPreferences.

### Caching Strategy

- **Cache Duration**: 1 hour (configurable)
- **Cache Validation**: Timestamp-based
- **Cache Policy**: 
  - Use cache if valid and no internet
  - Fetch fresh data if online and cache expired
  - Always fallback to cache on errors

---

## 📁 File Structure & Responsibilities

### Core Layer
- `app_constants.dart`: API endpoints, cache duration, error messages
- `app_theme.dart`: Light/dark theme configurations
- `date_formatter.dart`: Date formatting utilities

### Data Layer

**Models**
- `repository_model.dart`: Repository data model with Hive annotations
- `repository_model.g.dart`: Generated Hive type adapter

**Services**
- `api_service.dart`: GitHub API communication
  - Handles HTTP requests
  - Error handling and timeouts
  - Response parsing

- `local_storage_service.dart`: Local data persistence
  - Hive database operations
  - SharedPreferences management
  - Cache validation

**Repositories**
- `github_repository.dart`: Business logic layer
  - Coordinates API and storage
  - Implements offline strategy
  - Sorting logic

### Presentation Layer

**Providers**
- `repository_provider.dart`: Repository state management
  - Fetching state
  - Loading state
  - Error handling
  - Sort updates

- `theme_provider.dart`: Theme state management
  - Light/dark mode toggle
  - Preference persistence

**Screens**
- `home_screen.dart`: Repository list screen
  - Sort toggle
  - Theme toggle
  - Pull-to-refresh
  - Offline indicator
  - List rendering

- `details_screen.dart`: Repository details screen
  - Owner information
  - Statistics (stars, forks, watchers)
  - Repository metadata
  - Browser link

### Widgets
- `repository_card.dart`: Repository list item
- `error_widget.dart`: Error display with retry
- `loading_widget.dart`: Loading indicators

---

## 🔧 Configuration

### API Configuration
Edit `lib/core/constants/app_constants.dart`:

```dart
static const String baseUrl = 'https://api.github.com';
static const String searchQuery = 'flutter'; // Change search keyword
static const int perPage = 50; // Number of results
```

### Cache Duration
```dart
static const Duration cacheValidDuration = Duration(hours: 1);
```

### Theme
Customize in `lib/core/theme/app_theme.dart`

---

## 🧪 Testing

### Run Tests
```bash
flutter test
```

### Manual Testing Checklist
- [ ] App launches successfully
- [ ] Repositories load on first launch
- [ ] Sort by stars works
- [ ] Sort by updated works
- [ ] Sorting persists after restart
- [ ] Theme toggle works
- [ ] Theme persists after restart
- [ ] Details page displays correctly
- [ ] Pull-to-refresh works
- [ ] Offline mode works (airplane mode)
- [ ] Data persists after app restart
- [ ] Open in browser works
- [ ] Error handling displays messages

---

## 🐛 Troubleshooting

### Issue: Build Runner Fails
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: Hive Error on Launch
- Delete app data and reinstall
- Or clear cache programmatically

### Issue: No Data in Offline Mode
- Ensure data was fetched at least once online
- Check Hive box initialization

### Issue: API Rate Limit
- GitHub API has rate limits (60 requests/hour unauthenticated)
- Wait for rate limit reset
- Consider implementing API token authentication

---

## 📝 API Reference

### GitHub Search API
```
GET https://api.github.com/search/repositories
```

**Parameters:**
- `q`: Search query (e.g., "flutter")
- `sort`: Sort field (stars, forks, updated)
- `order`: Sort order (asc, desc)
- `per_page`: Results per page (max 100)

**Rate Limits:**
- Unauthenticated: 60 requests/hour
- Authenticated: 5,000 requests/hour

---

## 🚀 Future Enhancements

- [ ] Implement search functionality
- [ ] Add pagination for more repositories
- [ ] GitHub authentication for higher rate limits
- [ ] Favorites/bookmarks feature
- [ ] Filter by language, stars range
- [ ] Share repository feature
- [ ] Unit and integration tests
- [ ] CI/CD pipeline
- [ ] App flavors (dev/staging/prod)
- [ ] Analytics integration

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 🙏 Acknowledgments

- [GitHub API](https://docs.github.com/en/rest) for providing free API access
- [Flutter Team](https://flutter.dev) for the amazing framework
- [Riverpod](https://riverpod.dev) for robust state management
- [Hive](https://docs.hivedb.dev) for fast local storage

---


---

**Made with ❤️ using Flutter**

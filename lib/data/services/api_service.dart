import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/repository_model.dart';
import '../../core/constants/app_constants.dart';

class ApiService {
  // Fetch repositories from GitHub API
  Future<List<RepositoryModel>> fetchRepositories() async {
    try {
      final url = Uri.parse(
        '${AppConstants.baseUrl}${AppConstants.searchEndpoint}'
        '?q=${AppConstants.searchQuery}'
        '&sort=stars'
        '&order=desc'
        '&per_page=${AppConstants.perPage}'
      );

      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/vnd.github.v3+json',
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw Exception('Request timeout');
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> items = data['items'] ?? [];
        
        return items
            .map((json) => RepositoryModel.fromJson(json))
            .toList();
      } else if (response.statusCode == 403) {
        throw Exception('API rate limit exceeded. Please try again later.');
      } else if (response.statusCode == 422) {
        throw Exception('Invalid search query.');
      } else {
        throw Exception('Failed to load repositories: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('SocketException') || 
          e.toString().contains('HandshakeException')) {
        throw Exception('No internet connection');
      }
      rethrow;
    }
  }
}
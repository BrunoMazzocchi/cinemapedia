import 'package:cinemapedia/config/api_client.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(
    baseUrl: 'https://api.themoviedb.org/3',
    apiKey: Environment.movieApiKey, 
  );
});

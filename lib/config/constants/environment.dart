import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment { 
  static String movieApiKey = dotenv.env['THE_MOVIE_DB_KEY'] ?? 'no api key loaded';
}
import 'package:cinemapedia/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/providers/providers.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  // Start shared preferences instance
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferences.getInstance();

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeDataProvider),
    );
  }
}

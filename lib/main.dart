import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoom_clone/core/providers/auth_provider.dart';
import 'package:zoom_clone/features/auth/screens/google_login_screen.dart';
import 'package:zoom_clone/features/home/app_main_screen.dart';
import 'package:zoom_clone/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);
    return MaterialApp(
      home: authState.when(
        data: (user) {
          if (user != null) {
            return AppMainScreen();
          } else {
            return GoogleLoginScreen();
          }
        },
        error: (error, stackTrace) => Scaffold(
          body: Center(
            child: Text(
              error.toString(),
            ),
          ),
        ),
        loading: () => Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'D:\/Flutter Projects/kavach24/lib/helpers/app_localizations.dart';
import 'D:\/Flutter Projects/kavach24/lib/screens/home_screen.dart';
import 'D:\/Flutter Projects/kavach24/lib/screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppLanguage(),
      child: Consumer<AppLanguage>(
        builder: (context, appLanguage, child) {
          return MaterialApp(
            title: 'Kavach',
            theme: ThemeData(
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (ctx, userSnapshot) {
                if (userSnapshot.hasData) {
                  return const HomeScreen();
                }
                return const AuthScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
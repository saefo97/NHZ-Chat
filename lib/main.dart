import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nhzchat/components/loading_screen.dart';
import 'package:nhzchat/screens/chat_page.dart';
import 'package:nhzchat/theme_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:  themeProvider.isDarkMode
              ? ThemeData.dark()
              : ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue.shade900,
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
            drawerTheme: const DrawerThemeData(
              elevation: 6,
            ),
          ),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final User? user = snapshot.data;
                if (user == null) {
                  return HomePage();
                } else {
                  return ChatScreen();
                }
              }
              return const LoadingScreen();
            },
          ),
        );
      },
    );
  }
}

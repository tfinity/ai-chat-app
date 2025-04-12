import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/core/theme.dart';
import 'package:mobile_app/providers/theme_provider.dart';
import 'screens/chat_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ThemeProviderWidget(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return MaterialApp(
      title: 'AI Chat Assistant',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeProvider.themeMode,
      home: const ChatScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http_app/providers/bottom_nav_provider.dart';
import 'package:http_app/providers/theme_provider.dart';
import 'package:http_app/routes/routes.dart';
import 'package:http_app/themes/custom_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<BottomNavBarProvider>(
          create: (context) => BottomNavBarProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Http App',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.getTheme,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      routes: Routes.routes,
      initialRoute: Routes.splash,
    );
  }
}

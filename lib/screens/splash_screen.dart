import 'dart:developer';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http_app/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _prefs = EncryptedSharedPreferences();

  static const _firstSeen = 'firstSeen';

  Future<void> _checkFirstSeen() async {
    await _prefs.getString(_firstSeen).then((String firstTime) async {
      log('First Time? $firstTime');
      if (firstTime == 'no') {
        // If this is not the first time the application has been opened, start page.
        Navigator.of(context).pushReplacementNamed(Routes.bottom);
      } else {
        await _prefs.setString(_firstSeen, 'no');
        // If this is the first time the app has been opened, slide presentation.
        Navigator.of(context).pushReplacementNamed(Routes.intro);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}

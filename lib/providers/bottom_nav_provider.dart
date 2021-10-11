import 'package:flutter/material.dart';

class BottomNavBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    _debugProvider();
    notifyListeners();
  }

  void _debugProvider() {
    print('Current tab: $_currentIndex');
  }
}

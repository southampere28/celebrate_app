import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ContentProvider with ChangeNotifier {
  List<Map<String, dynamic>> _contentList = [];
  int _currentIndex = 0;
  String _senderName = "Pramudya Putra";

  // Getters
  List<Map<String, dynamic>> get contentList => _contentList;
  String get currentTitle => _contentList.isNotEmpty ? _contentList[_currentIndex]['title'] : '';
  String get currentGreeting => _contentList.isNotEmpty ? _contentList[_currentIndex]['greeting'] : '';
  String get currentImage => _contentList.isNotEmpty ? _contentList[_currentIndex]['image'] : '';
  int get currentIndex => _currentIndex;
  String get senderName => _senderName;

  // Method to load JSON data
  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final List<dynamic> data = json.decode(response);
    _contentList = data.map((e) => Map<String, dynamic>.from(e)).toList();
    _currentIndex = 0; // Reset to the first content
    notifyListeners();
  }

  // Method to update content based on the index
  void updateContent(int index) {
    if (index >= 0 && index < _contentList.length) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}

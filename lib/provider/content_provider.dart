import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ContentProvider with ChangeNotifier {
  final List<String> _images = [
    'assets/sample.jpg',
    'assets/sample2.jpg',
    'assets/sample.jpg'
  ];
  final List<String> _titles = ['title1', 'title2', 'title3'];
  final List<String> _greetings = ['greeting1', 'greeting2', 'greeting3'];
  final String _senderName = "Pramudya Putra";

  String _titleContent = '';
  String _greetingContent = '';
  int _currentIndex = 0;
  Map<String, dynamic>? _jsonData;

  // Getters
  List<String> get images => _images;
  String get titleContent => _titleContent;
  String get greetingContent => _greetingContent;
  int get currentIndex => _currentIndex;
  String get senderName => _senderName;

  // Method to load JSON data
  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);
    _jsonData = data;

    // Initialize the first content
    _titleContent = _jsonData?[_titles[0]] ?? '';
    _greetingContent = _jsonData?[_greetings[0]] ?? '';
    notifyListeners();
  }

  // Method to update content based on the index
  void updateContent(int index) {
    _currentIndex = index;
    _titleContent = _jsonData?[_titles[index]] ?? '';
    _greetingContent = _jsonData?[_greetings[index]] ?? '';
    notifyListeners();
  }
}

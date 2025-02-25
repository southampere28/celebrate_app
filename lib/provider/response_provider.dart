import 'dart:developer';
import 'package:celebrate_app/apikey.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/material.dart';

class ResponseProvider with ChangeNotifier {
  String _response = '';
  bool _isLoading = false;

  String get response => _response;
  bool get isLoading => _isLoading;

  Future<void> generateResponse() async {
    _isLoading = true;
    notifyListeners();

    const prompt =
        'Tolong buatkan pesan terima kasih karena telah memberikan kado aplikasi ucapan (aplikasi ini menampilkan foto2 kenangan serta ucapan) dan juga terimakasih atas semua hal yang telah pengirim berikan kepada penerima, dalam bentuk plain text tanpa imbuhan apapun setelahnya';

    try {
      final model = GenerativeModel(
          model: 'gemini-1.5-flash-latest',
          apiKey: apiKey);
      final content = [Content.text(prompt)];
      final generatedResponse = await model.generateContent(content);

      _response = generatedResponse.text ?? 'No message found';
      // log(generatedResponse.text ?? 'no response');
    } catch (e) {
      Fluttertoast.showToast(
          msg:
              'Cannot Generate Message, Please check your Internet Connection');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

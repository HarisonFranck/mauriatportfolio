import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  final apiKey = 'AIzaSyAyZF1ZGZSgSwN4OcaoEWKlYXCVG6uBgRY';
  print('Testing Gemini API with key: $apiKey');
  
  final models = [
    'gemini-3.6-flash',
    'gemini-2.5-flash',
    'gemini-2.0-flash',
    'gemini-1.0-pro',
  ];

  for (var modelName in models) {
    print('\n--- Testing $modelName ---');
    try {
      final model = GenerativeModel(model: modelName, apiKey: apiKey);
      final response = await model.generateContent([Content.text('Hello')]);
      print('Success! Response: ${response.text}');
      return; // Stop on first success
    } catch (e) {
      print('Error with $modelName: $e');
    }
  }
}

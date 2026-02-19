import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mauriatportfolio/data/portfolio_data.dart';

class AIService {
  static const String _apiKey = 'AIzaSyAyZF1ZGZSgSwN4OcaoEWKlYXCVG6uBgRY';
  late GenerativeModel _model;
  late ChatSession _chat;

  AIService() {
    // Model is initialized here, but we will start chat with specific prompt later or re-init
  }

  void startChat(String systemPrompt) {
    _model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: _apiKey,
      systemInstruction: Content.system(systemPrompt),
    );
    _chat = _model.startChat();
  }

  Future<String> sendMessage(String message) async {
    try {
      final response = await _chat.sendMessage(Content.text(message));
      return response.text ?? "I'm sorry, I couldn't understand that.";
    } catch (e) {
      print('AI Service Error: $e');
      if (e.toString().contains('User location is not supported')) {
         return "Error: User location is not supported for the API use.";
      }
      return "Error: Unable to connect to the AI service. Please check your internet connection or API key. Details: $e";
    }
  }
}

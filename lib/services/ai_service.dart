import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mauriatportfolio/data/portfolio_data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  late GenerativeModel _model;
  late ChatSession _chat;

  AIService() {
    // Model is initialized when `startChat` is called so we can provide a dynamic system prompt.
  }

  void startChat(String systemPrompt) {
    final apiKey = dotenv.env['GEN_AI_API_KEY'] ?? '';
    if (apiKey.isEmpty) {
      throw StateError(
        'GEN_AI_API_KEY is not set. Please add it to your .env file.',
      );
    }

    _model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: apiKey,
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

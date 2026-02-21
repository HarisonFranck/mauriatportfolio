import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mauriatportfolio/data/portfolio_data.dart';

class AIService {
  // Proxy URL for secure calls (no API key exposed)
  static const String _proxyUrl = String.fromEnvironment('AI_PROXY_URL');

  // Fallback API key for local development (will be empty in production)
  static const String _apiKey = String.fromEnvironment('GEN_AI_API_KEY');

  GenerativeModel? _model;
  ChatSession? _chat;
  String? _systemPrompt;

  void startChat(String systemPrompt) {
    _systemPrompt = systemPrompt;
    if (_proxyUrl.isEmpty) {
      if (_apiKey.isNotEmpty) {
        _model = GenerativeModel(
          model: 'gemini-2.5-flash',
          apiKey: _apiKey,
          systemInstruction: Content.system(systemPrompt),
        );
        _chat = _model!.startChat();
      } else {
        print('Warning: Neither AI_PROXY_URL nor GEN_AI_API_KEY is defined.');
      }
    }
  }

  Future<String> sendMessage(String message) async {
    try {
      // 1. Try secure proxy first
      if (_proxyUrl.isNotEmpty) {
        final response = await http.post(
          Uri.parse(_proxyUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'message': message,
            'systemPrompt': _systemPrompt,
          }),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          return data['response'] ?? "I'm sorry, I couldn't understand that.";
        } else {
          throw Exception('Proxy error: ${response.statusCode} - ${response.body}');
        }
      }

      // 2. Fallback to direct call (only for local dev)
      if (_chat != null) {
        final response = await _chat!.sendMessage(Content.text(message));
        return response.text ?? "I'm sorry, I couldn't understand that.";
      }

      return "Error: AI Service not initialized. Please check your configuration.";
    } catch (e) {
      print('AI Service Error: $e');
      if (e.toString().contains('User location is not supported')) {
        return "Error: User location is not supported for the API use.";
      }
      return "Error: Unable to connect to the AI service. Details: $e";
    }
  }
}

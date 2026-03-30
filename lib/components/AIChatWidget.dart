import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mauriatportfolio/l10n/app_localizations.dart';
import 'package:mauriatportfolio/data/portfolio_data.dart';
import 'package:mauriatportfolio/services/ai_service.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AIChatWidget extends StatefulWidget {
  const AIChatWidget({super.key});

  @override
  State<AIChatWidget> createState() => _AIChatWidgetState();
}

class _AIChatWidgetState extends State<AIChatWidget> {
  final AIService _aiService = AIService();
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, String>> _messages = [];
  List<String> _currentSuggestions = [];
  bool _isOpen = false;
  bool _isLoading = false;
  String _currentLang = '';

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize or re-initialize chat if language changes
    final newLang = Localizations.localeOf(context).languageCode;
    if (_currentLang != newLang) {
      _currentLang = newLang;
      final l10n = AppLocalizations.of(context)!;
      _messages = [
        {'role': 'ai', 'message': l10n.aiWelcomeMessage},
      ];
      _updateSuggestions();
      _aiService.startChat(PortfolioData.getSystemPrompt(_currentLang));
    }
  }

  void _updateSuggestions([String? lastSelected]) {
    final l10n = AppLocalizations.of(context)!;
    final all = [
      l10n.aiSuggestionProjects,
      l10n.aiSuggestionSkills,
      l10n.aiSuggestionEducation,
      l10n.aiSuggestionAI,
      l10n.aiSuggestionBigData,
      l10n.aiSuggestionContact,
      l10n.aiSuggestionPassions,
      l10n.aiSuggestionWhyAI,
      l10n.aiSuggestionWhyMobile,
      l10n.aiSuggestionChallenge,
    ];
    final history = _messages.map((m) => m['message']).toSet();
    
    final available = all.where((s) => !history.contains(s) && s != lastSelected).toList();
    available.shuffle();
    
    setState(() {
      _currentSuggestions = available.take(3).toList();
    });
  }

  void _sendMessage({String? text}) async {
    final messageText = text ?? _controller.text;
    if (messageText.trim().isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'message': messageText});
      _isLoading = true;
      if (text == null) _controller.clear();
      _currentSuggestions = []; // Clear while thinking
    });
    _scrollToBottom();

    try {
      final response = await _aiService.sendMessage(messageText);
      
      // Professional Error Handling: Mask technical details or quota issues
      if (response.toLowerCase().contains("proxy error") || 
          response.toLowerCase().contains("quota exceeded") ||
          response.toLowerCase().contains("exception")) {
        throw Exception("Technical error masked");
      }

      setState(() {
        _messages.add({'role': 'ai', 'message': response});
      });
      _updateSuggestions();
      _scrollToBottom();
    } catch (e) {
      final l10n = AppLocalizations.of(context)!;
      setState(() {
        _messages.add({'role': 'ai', 'message': l10n.aiErrorMessage});
      });
      _scrollToBottom();
    } finally {
      setState(() {
        _isLoading = false;
      });
      if (_currentSuggestions.isEmpty && !_isLoading) {
        _updateSuggestions();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Positioned(
      bottom: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isOpen)
            Container(
              width: 350,
              height: 500,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A), // Dark slate blue background
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Column(
                children: [
                  // --- Header ---
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B), // Slightly lighter header
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white.withOpacity(0.05),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        // Icon
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6366F1).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.auto_awesome,
                            color: Color(0xFF6366F1), // Indigo/Purple accent
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Title & Subtitle
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.aiAssistantTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                l10n.aiAssistantSubtitle,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Close Button
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white54,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _isOpen = false;
                            });
                          },
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),

                  // --- Chat Area ---
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final msg = _messages[index];
                        final isUser = msg['role'] == 'user';
                        return Align(
                          alignment: isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            constraints: const BoxConstraints(maxWidth: 260),
                            decoration: BoxDecoration(
                              color: isUser
                                  ? const Color(0xFF6366F1) // User bubble: Indigo
                                  : const Color(0xFF1E293B), // AI bubble: Dark slate
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(16),
                                topRight: const Radius.circular(16),
                                bottomLeft: isUser
                                    ? const Radius.circular(16)
                                    : const Radius.circular(4),
                                bottomRight: isUser
                                    ? const Radius.circular(4)
                                    : const Radius.circular(16),
                              ),
                            ),
                            child: isUser
                                ? Text(
                                    msg['message'] ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      height: 1.4,
                                    ),
                                  )
                                : MarkdownBody(
                                    data: msg['message'] ?? '',
                                    styleSheet: MarkdownStyleSheet(
                                      p: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        height: 1.4,
                                        fontSize: 14,
                                      ),
                                      strong: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      listBullet: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ),

                  // --- Suggestions Area ---
                  if (_currentSuggestions.isNotEmpty && !_isLoading)
                    Container(
                      height: 54, // Slightly taller for better padding
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _currentSuggestions.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => _sendMessage(text: _currentSuggestions[index]),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF6366F1).withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color(0xFF6366F1).withOpacity(0.35),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      _currentSuggestions[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13, // Slightly larger
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                  // --- Loading Indicator ---
                  if (_isLoading)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Color(0xFF1E293B),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  // --- Input Area ---
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      border: Border(
                        top: BorderSide(color: Colors.white.withOpacity(0.05)),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F172A), // Darker input bg
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: l10n.aiInputHint,
                                hintStyle: TextStyle(color: Colors.white38),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              onSubmitted: (_) => _sendMessage(),
                            ),
                          ),
                          const SizedBox(width: 18),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF6366F1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.send_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: _sendMessage,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // --- Floating Toggle Button ---
          FloatingActionButton(
            backgroundColor: const Color(0xFF6366F1),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPressed: () {
              setState(() {
                _isOpen = !_isOpen;
              });
            },
            child: Icon(
              _isOpen ? Icons.close_rounded : Icons.smart_toy_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

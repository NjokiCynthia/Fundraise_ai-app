import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  static const _apiKey = 'AIzaSyAk1db5gCEx34WZ_yNtnQqZAVif9hjRRnA';

  static final _model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey: _apiKey,
  );

  static Future<List<String>> generateDescriptions({
    required String name,
    required String goal,
    required String targetAmount,
  }) async {
    final prompt = '''
Generate 3 short, inspiring fundraising campaign descriptions for a campaign called "$name" that aims to raise KES $targetAmount for the goal: "$goal".

Keep them Kenyan-friendly, warm, motivational, and easy to understand. Label each as "Option 1:", "Option 2:", and "Option 3:". Avoid making them too long.
''';

    final content = [Content.text(prompt)];
    final response = await _model.generateContent(content);
    final text = response.text ?? '';

    // Extract the 3 options
    final options =
        RegExp(r'Option \d+:').allMatches(text).map((m) => m.start).toList();

    final descriptions = <String>[];
    for (int i = 0; i < options.length; i++) {
      final start = options[i];
      final end = (i + 1 < options.length) ? options[i + 1] : text.length;
      final snippet = text.substring(start, end).trim();
      descriptions.add(snippet);
    }

    return descriptions;
  }
}

import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  static const _apiKey = 'AIzaSyAk1db5gCEx34WZ_yNtnQqZAVif9hjRRnA';

  static final _model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey: _apiKey,
  );

  static Future<String> generateDescription({
    required String name,
    required String goal,
    required String targetAmount,
  }) async {
    final prompt = '''
Generate a short, inspiring fundraising campaign description for a campaign called "$name" that aims to raise KES $targetAmount for the goal: "$goal".
Avoid being too long. Make it human, Kenyan-friendly, and motivational.
''';

    final content = [Content.text(prompt)];
    final response = await _model.generateContent(content);
    return response.text ?? "No description generated.";
  }
}

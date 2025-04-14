import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  // Create a user via ActionHero backend
  Future<Map<String, dynamic>> createUser(String name, String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/createUser'),
        headers: {
          'Content-Type': 'application/json',
          'Cookie': 'sessionID=204bb43161db4d83b616fddac9a7da855642b6c1',
        },
        body: jsonEncode({'name': email, 'email': name}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create user: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>> createFundraiser({
    required String campaignName,
    required double targetAmount,
    required String goal,
    required String description,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/createFundraiser'),
        headers: {
          'Content-Type': 'application/json',
          'Cookie': 'sessionID=204bb43161db4d83b616fddac9a7da855642b6c1',
        },
        body: jsonEncode({
          'title': campaignName,
          'goalAmount': targetAmount,
          'description': description,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create fundraiser: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

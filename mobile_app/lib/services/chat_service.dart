import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  // Change this URL based on your setup:
  // For emulator: http://10.0.2.2:3000
  // For physical device: use your computer's IP address
  final String baseUrl = 'http://10.0.2.2:3000';

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/chat'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'message': message}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['reply'] as String;
      } else {
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error communicating with the server: $e');
    }
  }
}

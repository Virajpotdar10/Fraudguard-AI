import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fraud_detector/models/transaction_input.dart';
import 'package:fraud_detector/models/fraud_prediction.dart';

class ApiService {
  // ✅ Use environment variable or fallback to localhost for development
  static String get baseUrl => const String.fromEnvironment(
        'API_URL',
        defaultValue: 'http://localhost:8000',
      );

  Future<FraudPrediction> predictFraud(TransactionInput transaction) async {
    try {
      final url = Uri.parse('$baseUrl/predict');

      final response = await http.post(
        url,
        headers: const {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(transaction.toJson()),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        return FraudPrediction.fromJson(jsonData);
      } else {
        throw Exception(
          'API Error: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      if (e.toString().contains('Failed host lookup') ||
          e.toString().contains('Connection refused')) {
        throw Exception(
          'Cannot connect to server. Please check:\n'
          '1. Backend is running\n'
          '2. Correct IP address/URL\n'
          '3. Network connection',
        );
      }
      rethrow;
    }
  }
}

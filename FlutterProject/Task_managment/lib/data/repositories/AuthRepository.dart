import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/model.dart';

class AuthRepository {

  static Future<Map<String, dynamic>> signUp(User user) async {
    var url = Uri.parse(ApiConstants.SignUpEndPoint);
    var body = {
      'full_name': user.fullName,
      'phone_number': user.phoneNumber,
      'email': user.email,
      'password': user.password,
      'confirmed_password': user.confirmPassword,
    };

    var response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      // Successful signup
      var jsonResponse = jsonDecode(response.body);

      return jsonResponse; // Return the response data
    } else {
      // Error occurred
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }


static Future<Map<String, dynamic>> login(User user) async {
  var url = Uri.parse(ApiConstants.loginEndPoint);
  var body = {
    'email': user.email,
    'password': user.password,
  };

  var response = await http.post(url, body: body);

  if (response.statusCode == 404 || response.statusCode == 200) {
// Successful signup
    var jsonResponse = jsonDecode(response.body);

    return jsonResponse; // Return the response data
  } else {
// Error occurred
    throw Exception('Request failed with status: ${response.statusCode}.');
  }
}
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_managment/data/model/apiconstants.dart';
import 'package:task_managment/data/model/Projectmodel.dart';

class ProjectRepository {

  static Future<List<Project>> getProjects(String token) async {

    //print(token);
    final String baseUrl = ApiConstants.getAllProjectEndPoint;

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);

    if (response.statusCode == 200) {

      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> projectData = jsonData['data'];
      print(projectData);

      print(jsonData.toString());

      final projects = projectData.map((item) => Project.fromJson(item)).toList();
      return projects;
    } else {
      throw Exception('Failed to fetch projects');
    }
  }
}

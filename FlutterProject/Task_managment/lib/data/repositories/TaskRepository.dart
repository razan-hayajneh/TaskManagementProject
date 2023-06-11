

import 'dart:convert';

import '../model/Task.dart';
import 'package:http/http.dart' as http;

class TaskRepository {
  Future<List<Task>> getTasks(String token, int projectId, String taskStatus) async {
    final url = 'https://taskmanagement.schooldemos.com/api/v1/tasks?project_id=$projectId&task_statues=$taskStatus';

    final response = await http.get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final tasksData = jsonData['data'] as List<dynamic>;

      final tasks = tasksData.map((taskData) => Task.fromJson(taskData)).toList();
      return tasks;
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }
}

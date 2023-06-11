class Task {
  final int id;
  final String name;
  final String taskStatus;
  final int projectId;
  final int categoryId;
  final String categoryName;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  static double percent(int totalTasks, int completeTasks) {
    try {
      final percentValue = completeTasks / totalTasks;
      if (percentValue.isNaN || percentValue.isInfinite) {
        return 0.0;
      }
      return percentValue;
    } catch (_) {
      return 0.0;
    }
  }
  Task({
    required this.id,
    required this.name,
    required this.taskStatus,
    required this.projectId,
    required this.categoryId,
    required this.categoryName,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      taskStatus: json['task_status'],
      projectId: int.parse(json['project_id']),
      categoryId: int.parse(json['category_id']),
      categoryName: json['category_name'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

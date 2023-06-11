class Project {
  late String Id;
  late String name;
  late String description;
  late String managerName;
  late String projectStatus;
  late String startDate;
  late String endDate;
  late String createdAt;
  late String updatedAt;
  late String managerId;

  Project({
    required this.Id,
    required this.name,
    required this.description,
    required this.managerName,
    required this.projectStatus,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.managerId,
  });


  Project.withStartDateEndDateNameManagerName({
    required this.startDate,
    required this.endDate,
    required this.name,
    required this.managerName,
  }) {
    Id = '';
    description = '';
    projectStatus = '';
    createdAt = '';
    updatedAt = '';
    managerId = '';
  }
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      Id: json['projectId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      managerName: json['manager_name'] as String? ?? '',
      projectStatus: json['project_status'] as String? ?? '',
      startDate: json['start_date'] as String? ?? '',
      endDate: json['end_date'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      managerId: json['manager_id'] as String? ?? '',
    );
  }

  }


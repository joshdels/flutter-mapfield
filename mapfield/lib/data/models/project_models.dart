class ProjectModel {
  final String uid;
  final String name;
  final String selectedBasemap;
  final DateTime createdAt;
  final String createdBy;
  final DateTime lastOpened;
  final List<Map<String, dynamic>> fields;
  final double zoomLevel;
  final double centerLatitude;
  final double centerLongitude;

  ProjectModel({
    required this.uid,
    required this.name,
    required this.selectedBasemap,
    required this.createdAt,
    required this.createdBy,
    required this.lastOpened,
    required this.fields,
    required this.zoomLevel,
    required this.centerLatitude,
    required this.centerLongitude,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      selectedBasemap: json['selectedBasemap'] ?? 'streets',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      createdBy: json['createdBy'] ?? '',
      lastOpened: json['lastOpened'] != null
          ? DateTime.parse(json['lastOpened'])
          : DateTime.now(),
      fields: List<Map<String, dynamic>>.from(json['fields'] ?? []),
      zoomLevel: (json['zoomLevel'] ?? 2.0).toDouble(),
      centerLatitude: (json['centerLatitude'] ?? 0.0).toDouble(),
      centerLongitude: (json['centerLongitude'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'selectedBasemap': selectedBasemap,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
      'lastOpened': lastOpened.toIso8601String(),
      'fields': fields,
      'zoomLevel': zoomLevel,
      'centerLatitude': centerLatitude,
      'centerLongitude': centerLongitude,
    };
  }
}

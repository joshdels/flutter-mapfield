class GISLayerModel {
  final String id;
  final String projectId;
  final String name;
  final String type;
  final String path;
  final DateTime createdAt;

  GISLayerModel({
    required this.id,
    required this.projectId,
    required this.name,
    required this.type,
    required this.path,
    required this.createdAt,
  });

  factory GISLayerModel.fromJson(Map<String, dynamic> json) {
    return GISLayerModel(
      id: json['id']?.toString() ?? '',
      projectId: json['projectId'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      path: json['path'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectId': projectId,
      'name': name,
      'type': type,
      'path': path,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  GISLayerModel copyWith({
    String? id,
    String? projectId,
    String? name,
    String? type,
    String? path,
    DateTime? createdAt,
  }) {
    return GISLayerModel(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      type: type ?? this.type,
      path: path ?? this.path,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'GISLayerModel(id: $id, projectId: $projectId, name: $name, type: $type, path: $path, createdAt: $createdAt)';
  }
}

import 'dart:convert';

class ProjectModel {
  final String id;
  final String name;
  final String selectedBasemap;
  final String tileUrl;
  final DateTime createdAt;
  final String createdBy;
  final DateTime lastOpened;
  final List<Map<String, dynamic>> fields;
  final double zoomLevel;
  final double centerLatitude;
  final double centerLongitude;

  ProjectModel({
    required this.id,
    required this.name,
    required this.selectedBasemap,
    required this.tileUrl,
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
      id: json['id']?.toString() ?? json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      selectedBasemap: json['selectedBasemap'] ?? 'streets',
      tileUrl:
          json['tileUrl'] ??
          'http://mt0.google.com/vt/lyrs=m&hl=en&x={x}&y={y}&z={z}',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      createdBy: json['createdBy'] ?? '',
      lastOpened: json['lastOpened'] != null
          ? DateTime.parse(json['lastOpened'])
          : DateTime.now(),
      fields: json['fields'] is String
          ? List<Map<String, dynamic>>.from(jsonDecode(json['fields']))
          : List<Map<String, dynamic>>.from(json['fields'] ?? []),
      zoomLevel: (json['zoomLevel'] ?? 2.0).toDouble(),
      centerLatitude: (json['centerLatitude'] ?? 0.0).toDouble(),
      centerLongitude: (json['centerLongitude'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'selectedBasemap': selectedBasemap,
      'tileUrl': tileUrl,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
      'lastOpened': lastOpened.toIso8601String(),
      'fields': jsonEncode(fields),
      'zoomLevel': zoomLevel,
      'centerLatitude': centerLatitude,
      'centerLongitude': centerLongitude,
    };
  }

  ProjectModel copyWith({
    String? id,
    String? name,
    String? selectedBasemap,
    String? tileUrl,
    DateTime? createdAt,
    String? createdBy,
    DateTime? lastOpened,
    List<Map<String, dynamic>>? fields,
    double? zoomLevel,
    double? centerLatitude,
    double? centerLongitude,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      selectedBasemap: selectedBasemap ?? this.selectedBasemap,
      tileUrl: tileUrl ?? this.tileUrl,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      lastOpened: lastOpened ?? this.lastOpened,
      fields: fields ?? this.fields,
      zoomLevel: zoomLevel ?? this.zoomLevel,
      centerLatitude: centerLatitude ?? this.centerLatitude,
      centerLongitude: centerLongitude ?? this.centerLongitude,
    );
  }

  @override
  String toString() {
    return 'ProjectModel(id: $id, name: $name, fieldsCount: ${fields.length}, selectedBasemap: $selectedBasemap,  tileUrl: $tileUrl,)';
  }
}

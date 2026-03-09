class ProjectField {
  final String id;
  final String name;
  final String type;

  ProjectField({required this.id, this.name = '', this.type = 'Text'});

  ProjectField copyWith({String? name, String? type}) {
    return ProjectField(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }
}

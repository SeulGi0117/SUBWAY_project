class Data {
  late String title;
  late String description;

  Data({
    required this.title,
    required this.description,
  });

  Data.fromMap(Map<String dynamic>? map) {
    title = map?['title'] ?? '';
    description = map?['description'] ?? '';
  }
}

class TodoFields {
  static String id = "id";
  static String title = "title";
  static String description = "description";
  static String date = "date";
  static String categoryId = "categoryId";
  static String isCompleted = "isCompleted";
  static String createdAt = 'createdAt';
}

class TodoModel {
  final int? id;
  final String createdAt;
  final String title;
  final String description;
  final String date;
  final int categoryId;
  final int isCompleted;
  bool isTitleExpanded = false;

  TodoModel({
    this.id,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.date,
    required this.categoryId,
    required this.isCompleted,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] ?? -1,
      createdAt: json['createdAt'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      date: json['date'] ?? '',
      categoryId: json['categoryId'] ?? -1,
      isCompleted: json['isCompleted'] ?? -1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'title': title,
      'description': description,
      'date': date,
      'categoryId': categoryId,
      'isCompleted': isCompleted,
    };
  }

  TodoModel copyWith({
    String? createdAt,
    int? id,
    String? title,
    String? description,
    String? date,
    int? categoryId,
    int? priority,
    int? isCompleted,
  }) =>
      TodoModel(
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        categoryId: categoryId ?? this.categoryId,
        isCompleted: isCompleted ?? this.isCompleted,
      );
}

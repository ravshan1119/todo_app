
class ToDoModelFields {
  static const String id = "_id";
  static const String title = "title";
  static const String description = "description";
  static const String categoryId = "category";
  static const String createdAt = "createdAt";
  static const String expiredDate = "expiredDate";
  static const String status = "status";
  static const String toDoImportance = "toDoImportance";


  static const String toDoTable = "toDos";


}

class ToDoModelSql {
  int? id;
  final String title;
  final String description;
  final int categoryId;
  final String createdAt;
  final String expiredDate;
  final int status;
  final int toDoImportance;

  ToDoModelSql({
    this.id,
    required this.expiredDate,
    required this.description,
    required this.title,
    required this.createdAt,
    required this.categoryId,
    required this.status,
    required this.toDoImportance,
  });

  ToDoModelSql copyWith({
    String? title,
    String? description,
    int? categoryId,
    String? createdAt,
    String? expiredDate,
    int? status,
    int? toDoImportance,
    int? id,
  }) {
    return ToDoModelSql(
      expiredDate: expiredDate ?? this.expiredDate,
      description: description ?? this.description,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      categoryId: categoryId ?? this.categoryId,
      status: status ?? this.status,
      toDoImportance: toDoImportance ?? this.toDoImportance,
      id: id ?? this.id,
    );
  }

  factory ToDoModelSql.fromJson(Map<String, dynamic> json) {
    return ToDoModelSql(
      expiredDate: json[ToDoModelFields.expiredDate] ?? "",
      description: json[ToDoModelFields.description] ?? "",
      title: json[ToDoModelFields.title] ?? "",
      createdAt: json[ToDoModelFields.createdAt] ?? "",
      categoryId: json[ToDoModelFields.categoryId] ?? 0,
      status: json[ToDoModelFields.status] ?? 0,
      toDoImportance: json[ToDoModelFields.toDoImportance] ?? 0,
      id: json[ToDoModelFields.id] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ToDoModelFields.expiredDate: expiredDate,
      ToDoModelFields.description: description,
      ToDoModelFields.title: title,
      ToDoModelFields.createdAt: createdAt,
      ToDoModelFields.categoryId: categoryId,
      ToDoModelFields.status: status,
      ToDoModelFields.toDoImportance: toDoImportance,
    };
  }

  @override
  String toString() {
    return '''
      expiredDate: $expiredDate,
      description: $description 
      title: $title
      createdAt: $createdAt 
      category: $categoryId 
      status: $status 
      toDoImportance: $toDoImportance, 
      id: $id, 
    ''';
  }
}

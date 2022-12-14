class Todo {
  String? todoText;
  bool? isCompleted;
  int? id;

  Todo.fromJson(Map json)
      : todoText = json["todo"],
        isCompleted = json["isCompleted"] == true,
        id = json["id"] as int;
}

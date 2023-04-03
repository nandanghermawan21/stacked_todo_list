class TodoModel {
  int? todoId;
  int? todoNumber;
  String? todoDesc;
  bool? isCheked;

  TodoModel({
    this.todoId,
    this.todoNumber,
    this.todoDesc,
    this.isCheked = false,
  });

  static List<TodoModel> dummy() {
    return [
      TodoModel(
        todoId: 1,
        todoNumber: 1,
        todoDesc: "Cleaning Up House",
        isCheked: false,
      ),
      TodoModel(
        todoId: 2,
        todoNumber: 2,
        todoDesc: "Go To Doctor",
        isCheked: false,
      ),
      TodoModel(
        todoId: 3,
        todoNumber: 3,
        todoDesc: "Shoping Groceries",
        isCheked: false,
      ),
    ];
  }
}

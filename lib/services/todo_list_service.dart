import 'package:my_first_stacked_app/model/todo_model.dart';
import 'package:stacked/stacked.dart';

class TodoListService with ListenableServiceMixin {
  final _todoList = ReactiveValue<List<TodoModel>>(
    TodoModel.dummy(),
  );

  List<TodoModel> get todoList => _todoList.value;

  void addNew() {
    _todoList.value.add(TodoModel(
      todoId: todoList.length + 2,
      todoDesc: "New todo",
      isCheked: false,
    ));
    notifyListeners();
  }

  void update(TodoModel todo) {
    int _index = _todoList.value.indexOf(todo);
    _todoList.value[_index] = todo;
    notifyListeners();
  }

  void delete(TodoModel todo) {
    _todoList.value.remove(todo);
    notifyListeners();
  }

  void setChecked(TodoModel todo, bool value) {
    todo.isCheked = value;
    notifyListeners();
  }
}

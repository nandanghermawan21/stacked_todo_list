import 'package:my_first_stacked_app/app/app.locator.dart';
import 'package:my_first_stacked_app/model/todo_model.dart';
import 'package:my_first_stacked_app/services/todo_list_service.dart';
import 'package:stacked/stacked.dart';

class TodoListViewModel extends ReactiveViewModel {
  final todoListServices = locator<TodoListService>();

  List<TodoModel> get todos => todoListServices.todoList;

  @override
  List<ListenableServiceMixin> get listenableServices => [todoListServices];
}

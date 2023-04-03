import 'package:flutter/material.dart';
import 'package:my_first_stacked_app/model/todo_model.dart';
import 'package:stacked/stacked.dart';

import 'todo_list_viewmodel.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoListViewModel>.reactive(
        viewModelBuilder: () => TodoListViewModel(),
        builder: (constext, model, _) {
          return Scaffold(
            floatingActionButton: Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  model.todoListServices.addNew();
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            appBar: AppBar(
              title: const Text("TODO LIST"),
            ),
            backgroundColor: Colors.grey.shade100,
            body: Container(
              color: Colors.transparent,
              child: Column(
                children: List.generate(model.todos.length, (index) {
                  return todoItem(
                    model.todos[index],
                    onChaged: (todo) {
                      model.todoListServices.update(todo);
                    },
                    onDelete: (todo) {
                      model.todoListServices.delete(todo);
                    },
                  );
                }),
              ),
            ),
          );
        });
  }

  Widget todoItem(
    TodoModel todo, {
    required ValueChanged<TodoModel> onChaged,
    required ValueChanged<TodoModel> onDelete,
  }) {
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = todo.todoDesc ?? "";
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, top: 5),
        padding: const EdgeInsets.only(left: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: double.infinity,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  onDelete(todo);
                },
                icon: const Icon(Icons.delete)),
            Expanded(
                child: TextField(
              controller: textEditingController,
              onSubmitted: (val) {
                todo.todoDesc = val;
                onChaged(todo);
              },
            )),
            Checkbox(
              value: todo.isCheked,
              onChanged: (val) {
                todo.isCheked = val;
                onChaged(todo);
              },
            ),
          ],
        ),
      ),
    );
  }
}

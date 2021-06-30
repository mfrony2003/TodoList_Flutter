import 'package:flutter/material.dart';
import 'package:todolist_application/model/task.dart';

class TaskProvier with ChangeNotifier {
  final List<Task> _todoTaskList = <Task>[];

  int getLength() {
    return _todoTaskList.length;
  }

  Task getTaskByIndex(int index) {
    return _todoTaskList[index];
  }

  void addTodoItem(String title) {
    _todoTaskList.add(Task(title));
    notifyListeners();
  }

  void onToogleTask(Task task) {
    task.setdone(!task.isdone());
    notifyListeners();
  }

  void onDeleteTask(int index) {
    _todoTaskList.removeAt(index);
    notifyListeners();
  }
}

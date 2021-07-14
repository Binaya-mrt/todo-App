import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ToDoModel {
  late int id;
  late String title;
  late bool isCompleted;
  late bool isArchived;

  ToDoModel({
    required this.isArchived,
    required this.isCompleted,
    required this.title,
    required this.id,
  });
}

class TodoController extends GetxController {
  List<ToDoModel> todos = <ToDoModel>[].obs;
  TextEditingController controller = TextEditingController();

  addToDo(ToDoModel todoModel) {
    todos.add(todoModel);
  }

  removeToDO(index) {
    todos.removeAt(index);
  }
}

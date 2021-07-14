import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

void main() => runApp(Todo());

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final toDoController = Get.put(TodoController());

    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff8e79fd),
          title: Text('Your Todos'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
                controller: toDoController.controller,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 3, primary: Color(0xff8e79fd)),
                onPressed: () {
                  toDoController.addToDo(
                    ToDoModel(
                        id: 1,
                        isArchived: false,
                        isCompleted: false,
                        title: toDoController.controller.text),
                  );
                  toDoController.controller.text = "";
                },
                child: Text('Add Task'),
              ),
              Expanded(
                child: Obx(() {
                  List<ToDoModel> toDos = toDoController.todos;
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(toDos[index].title),
                          trailing: IconButton(
                            onPressed: () => toDoController.removeToDO(index),
                            icon: Icon(Icons.remove_circle_outline_outlined),
                          ),
                        );
                      },
                      itemCount: toDoController.todos.length,
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

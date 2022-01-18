import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/database/database_fetch.dart';
import 'package:todo_app/model/task_data.dart';

class TaskController extends GetxController {
  RxList<TaskData> taskData = <TaskData>[].obs;
  TextEditingController? addTaskController;

  @override
  void onInit() {
    addTaskController = TextEditingController();
    _getData();
    super.onInit();
  }

  void _getData() {
    DatabaseHelper.instance.queryAllRows().then((value) {
      for (var element in value) {
        taskData.add(TaskData(id: element['id'], title: element['title']));
      }
    });
  }

  void addData() async {
    await DatabaseHelper.instance.insert(TaskData(title: addTaskController!.text));
    taskData.insert(0, TaskData(id: taskData.length, title: addTaskController!.text));
    addTaskController!.clear();
  }

  void deleteTask(int id) async {
    await DatabaseHelper.instance.delete(id);

    taskData.removeWhere((element) => element.id == id);
  }
}
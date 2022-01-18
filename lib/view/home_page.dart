import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_controller.dart';

class HomePage extends StatelessWidget {
  final TaskController _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: const Text("Todo List")),
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: TextFormField(
                  controller: _taskController.addTaskController,
                  decoration: const InputDecoration(hintText: "Enter a task"),
                )),
                IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      _taskController.addData();
                    })
              ],
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: _taskController.taskData.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Text('${_taskController.taskData[index].title}'),
                      trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _taskController.deleteTask(_taskController.taskData[index].id!)),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
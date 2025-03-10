import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _tasks = await DatabaseHelper().getTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await DatabaseHelper().insertTask(task);
    fetchTasks();
  }

  Future<void> updateTask(Task task) async {
    await DatabaseHelper().updateTask(task);
    fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await DatabaseHelper().deleteTask(id);
    fetchTasks();
  }
}

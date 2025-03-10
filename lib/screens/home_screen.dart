import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../screens/add_task_screen.dart';
import '../widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      body: taskProvider.tasks.isEmpty
          ? Center(
              child: Lottie.asset('assets/empty.json')) // Add Lottie animation
          : ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(task: taskProvider.tasks[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AddTaskScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

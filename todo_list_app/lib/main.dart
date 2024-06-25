import 'package:flutter/material.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final Map<String, String> todoList = {};

  final TextEditingController taskController = TextEditingController();

  void addTask(String task) {
    setState(() {
      todoList[task] = "Uncompleted";
    });
  }

  void deleteTask(String task) {
    setState(() {
      todoList.remove(task);
    });
  }

  void markTaskAsCompleted(String task) {
    setState(() {
      todoList[task] = "Completed";
    });
  }

  void markTaskAsUncompleted(String task) {
    setState(() {
      todoList[task] = "Uncompleted";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a task',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addTask(taskController.text);
              taskController.clear();
            },
            child: const Text('Add Task'),
          ),
          Expanded(
            child: ListView(
              children: todoList.entries.map((entry) {
                return ListTile(
                  title: Text(entry.key),
                  subtitle: Text(entry.value),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          markTaskAsCompleted(entry.key);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.undo),
                        onPressed: () {
                          markTaskAsUncompleted(entry.key);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          deleteTask(entry.key);
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

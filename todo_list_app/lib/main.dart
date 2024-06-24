import 'package:flutter/material.dart';

void main() {
  runApp(TodoListApp());
}

class TodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
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
        title: Text('To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(
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
            child: Text('Add Task'),
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
                        icon: Icon(Icons.check),
                        onPressed: () {
                          markTaskAsCompleted(entry.key);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.undo),
                        onPressed: () {
                          markTaskAsUncompleted(entry.key);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
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

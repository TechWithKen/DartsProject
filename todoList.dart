/* This code base is a program used to imitate the working principle of a todo list 
where individual or users of the app can perform the following operations

1. Add a new task
2. Delete a task
3. Mark a task as completed
4. Mark a task as uncompleted
5. View all Tasks
6. View all completed tasks
7. View all uncompleted tasks
8. Exit the app
*/

import "dart:io";
import "dart:async";

Map<String, String> todoList = {};

void addTask(String taskToAdd, Map<String, String> tasks) {
  tasks[taskToAdd] = "Uncompleted";
}

void deleteTask(String taskToDelete, Map<String, String> tasks) {
  tasks.remove(taskToDelete);
}

void completedTask(String taskCompleted, Map<String, String> tasks) {
  tasks[taskCompleted] = "Completed";
}

void uncompletedTask(String taskUncompleted, Map<String, String> tasks) {
  tasks[taskUncompleted] = "Uncompleted";
}

void viewTask(String taskToView, Map<String, String> tasks) {
  print(tasks[taskToView]);
}

void viewAllTasks(Map<String, String> tasks) {
  tasks.forEach((task, status) {
    print("$task is $status");
  });
}

List<String> viewCompletedTasks(Map<String, String> tasks) {
  List<String> completedTasks = [];
  tasks.forEach((task, status) {
    if (status == "Completed") {
      completedTasks.add(task);
    }
  });
  return completedTasks;
}

List<String> viewUncompletedTasks(Map<String, String> tasks) {
  List<String> uncompletedTasks = [];
  tasks.forEach((task, status) {
    if (status == "Uncompleted") {
      uncompletedTasks.add(task);
    }
  });
  return uncompletedTasks;
}

String? collectTask() {
  print("Enter the task: ");
  return stdin.readLineSync();
}

void main() async {
  print("Please select a choice to select the operation to perform on the todo list ");
  print("Creating TODO LIST........");
  await Future.delayed(Duration(seconds: 3));

  while (true) {
    print(
      "Please select an operation you would like to perform on the todo list:\n"
      "1: Add new task\n"
      "2: Delete Task\n"
      "3: Mark Task as Completed\n"
      "4: Mark Task as Uncompleted\n"
      "5: View All Tasks\n"
      "6: View Completed Tasks\n"
      "7: View Uncompleted Tasks\n"
      "8: View Task\n"
      "9: Exit"
    );
    
    var userChoice = stdin.readLineSync();

    switch (userChoice) {
      case "1":
        var theTask = collectTask();
        if (theTask != null) addTask(theTask, todoList);
        break;
      case "2":
        var theTask = collectTask();
        if (theTask != null) deleteTask(theTask, todoList);
        break;
      case "3":
        var theTask = collectTask();
        if (theTask != null) completedTask(theTask, todoList);
        break;
      case "4":
        var theTask = collectTask();
        if (theTask != null) uncompletedTask(theTask, todoList);
        break;
      case "5":
        viewAllTasks(todoList);
        break;
      case "6":
        print(viewCompletedTasks(todoList));
        break;
      case "7":
        print(viewUncompletedTasks(todoList));
        break;
      case "8":
        var theTask = collectTask();
        if (theTask != null) viewTask(theTask, todoList);
        break;
      case "9":
        exit(0);
      default:
        print("Invalid choice, please try again.");
    }
  }
}
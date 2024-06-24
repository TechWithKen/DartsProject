/*This code base is a program used to imitate the working principle of a todo list 
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

var todoList = {

};

addTask(String taskToAdd, Map<dynamic, dynamic> tasks){
  tasks[taskToAdd] = "Uncompleted";
}

deleteTask(String taskToDelete, Map<dynamic, dynamic> tasks){
  tasks.remove(taskToDelete);
}

completedTask(String taskCompleted, Map<dynamic, dynamic> tasks){
  tasks[taskCompleted] = "Completed";
}

uncompletedTask(String taskUncompleted, Map<dynamic, dynamic> tasks){
  tasks[taskUncompleted] = "Uncompleted";
}

viewTask(String taskToView, Map<dynamic, dynamic> tasks){
  print(tasks[taskToView]);
}

viewAllTasks(tasks){
  for (var task in tasks){
    print("$task is ${tasks[task]}");
  }
}

viewCompletedTasks(tasks){
  for (var task in tasks){
    if (tasks[task] == "Completed"){
      return task;
    }
  }
}

viewUncompletedTasks(tasks){
  for (var task in tasks){
    if (tasks[task] == "Uncompleted"){
      return task;
    }
  }
}
collectTask(){
  var userTask = stdin.readLineSync();
  return userTask;
}
void main() async{

  print("Please select a choice to select the operation to perform on the todo list ");
  print("Creating TODO LIST........");
  await Future.delayed(Duration(seconds: 3));
  print(
    "Pelase Select an operation you would like to perform on the todo list 1: Add new task, 2: Delete Task, 3: Mark Task as Completed" +
    "4: Mark Task as Uncompleted, 5: View All Tasks, 6: View Completed Tasks, 7: View Uncompleted Tasks, 8: View Task"
  );
  var userChoice = stdin.readLineSync();

  if (userChoice == "1"){
    var theTask = collectTask();
    addTask(theTask, todoList);
  }
  else if (userChoice == "2"){
    var theTask = collectTask();
    deleteTask(theTask, todoList);
  }
  else if(userChoice == "3"){
    var theTask = collectTask();
    completedTask(theTask, todoList);
  }
  else if (userChoice == "4"){
    var theTask = collectTask();
    uncompletedTask(theTask, todoList);
  }
  else if (userChoice == "5"){
    viewAllTasks(todoList);
  }
  else if(userChoice == "6"){
    print(viewCompletedTasks(todoList));
  }
  else if(userChoice == "7"){
    print(viewUncompletedTasks(todoList));
  }
  else if(userChoice == "8"){
    var theTask = collectTask();
    viewTask(theTask, todoList);
  }
  else{
    exit(0);
  }
}

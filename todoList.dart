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

viewAllTasks(Map<dynamic, dynamic> tasks){
  print(tasks);
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
void main(){
  print(todoList);
}
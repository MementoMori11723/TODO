// ignore: file_names
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  //* referance the box
  final _mybox = Hive.box('mybox');

  //* initial data of this app for the first time
  void createInitalData() {
    List toDoList = [
      ["Welcome to the app!", false],
      ["Try adding a task", false],
    ];
  }

  //* load data
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  //* update data
  void updateData() {
    _mybox.put("TODOLIST", toDoList);
  }
}

// ignore: file_names
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  //* referance the box
  final _mybox = Hive.box('mybox');

  void createinit() {
    toDoList = [
      ["Welcome to my app", false],
      ["Try adding a tasks"],
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

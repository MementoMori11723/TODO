// ignore: file_names
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List<dynamic> toDoList = [
    ["Welcome to my app", false],
  ];

  //* referance the box
  final _mybox = Hive.box('mybox');

  void createinit() {
    toDoList.add(
      ["Try adding a tasks", false],
    );
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

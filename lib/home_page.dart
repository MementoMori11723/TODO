import 'package:flutter/material.dart';
import 'dialog_box.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'To_Do_List.dart';
import 'DataBase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* referance hive box
  final _mybox = Hive.box('mybox');

  @override
  void initState() {
    //* check state
    if (_mybox.get("TODOLIST") == null) {
      db.createinit();
      db.loadData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //* text controller
  final _controller = TextEditingController();

  //* list of ToDo tasks
  ToDoDatabase db = ToDoDatabase();

  //* checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(
      () {
        db.toDoList[index][1] = !db.toDoList[index][1];
      },
    );
    db.updateData();
  }

  //* createing new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //* saving task
  void saveNewTask() {
    setState(
      () {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      },
    );
    Navigator.of(context).pop();
    db.updateData();
  }

  //* delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}

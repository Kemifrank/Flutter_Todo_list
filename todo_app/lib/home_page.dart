import 'package:flutter/material.dart';
import 'component/todo_tile.dart';
import 'dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List todoList = [
    ['Bath Eliana and Janina', false],
    ['Feed Eliana and Janina', false]
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: (saveNewTask),
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 194, 198, 204),
        appBar: AppBar(
          backgroundColor: Color(0xFF219ebc),
          centerTitle: true,
          title: const Text('To-do App'),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Color(0xFF219ebc),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoTile(
                taskname: todoList[index][0],
                taskCompleted: todoList[index][1],
                onChanged: (value) => checkboxChanged(value, index),
                deleteFunction: (Context) => deleteTask(index));
          },
        ));
  }
}

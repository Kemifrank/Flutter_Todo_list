import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deleteFunction;

  TodoTile(
      {super.key,
      required this.taskname,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Slidable(
        // ignore: prefer_const_constructors
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: (Icons.delete),
            borderRadius: BorderRadius.circular(10),
          ),
        ]),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Color(0xFF219ebc),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                taskname,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'myButton.dart';

class DialogBox extends StatelessWidget {


  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;


   DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: ('Add New Task')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButton(
                  text: 'Save',
                  onPressed: (onSave),
                ),
                const SizedBox(
                  width: 8,
                ),
                myButton(
                  text: 'Cancel',
                  onPressed: (onCancel)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //* get user input
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            //* buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //* save button
                MyButton(text: 'Save', onPressed: () {}),
                //* gap between the buttons
                const SizedBox(width: 20),
                //* cancel button
                MyButton(text: 'Cancel', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

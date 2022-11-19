import 'package:flutter/material.dart';
import 'package:todo/db/todo_model.dart';

class AddTask extends StatelessWidget {
  final textController = TextEditingController();
  final Function insertFunction;
  AddTask({required this.insertFunction, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              controller: textController,
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {
                var myTodo = Todo(
                    title: textController.text,
                    creationDate: DateTime.now(),
                    isChecked: false);

                insertFunction(myTodo);
                Navigator.pop(context);
              },
              child: Container(
                height: 60.0,
                width: 300.0,
                color: Colors.lightBlueAccent,
                child: const Center(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

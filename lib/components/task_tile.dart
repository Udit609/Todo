import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/db/todo_model.dart';

class TaskTile extends StatefulWidget {
  final int? id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;
  TaskTile(
      {required this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked,
      required this.insertFunction,
      required this.deleteFunction,
      Key? key})
      : super(key: key);

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    var anotherTodo = Todo(
        id: widget.id,
        title: widget.title,
        creationDate: widget.creationDate,
        isChecked: widget.isChecked);
    //
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Checkbox(
            value: widget.isChecked,
            onChanged: (bool? value) {
              setState(() {
                widget.isChecked = value!;
              });
              anotherTodo.isChecked = value!;
              widget.insertFunction(anotherTodo);
            },
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  decoration:
                      widget.isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                DateFormat('dd MMM yyyy - hh:mm aaa')
                    .format(widget.creationDate),
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8F8F8F),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            widget.deleteFunction(anotherTodo);
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}

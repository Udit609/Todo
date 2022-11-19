import 'package:flutter/material.dart';
import 'package:todo/db/db_model.dart';
import 'package:todo/components/task_tile.dart';

class TodoList extends StatelessWidget {
  final Function insertFunction;
  final Function deleteFunction;
  final db = DatabaseConnect();

  TodoList(
      {required this.insertFunction, required this.deleteFunction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.getTodo(),
      initialData: const [],
      builder: (_, AsyncSnapshot<List> snapshot) {
        if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'Add a task',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i) => TaskTile(
              id: snapshot.data![i].id,
              title: snapshot.data![i].title,
              creationDate: snapshot.data![i].creationDate,
              isChecked: snapshot.data![i].isChecked,
              insertFunction: insertFunction,
              deleteFunction: deleteFunction,
            ),
          );
        }
      },
    );
  }
}

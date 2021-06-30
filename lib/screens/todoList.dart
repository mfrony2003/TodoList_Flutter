import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_application/provider/cached.dart';
import 'package:todolist_application/provider/taskProvider.dart';
import 'package:todolist_application/screens/taskBuilder.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CachedData>(create: (_) => CachedData()),
        ChangeNotifierProvider<TaskProvier>(create: (_) => TaskProvier()),
      ],
      child: TaskBuilder(),
    );
  }
}

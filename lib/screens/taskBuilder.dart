import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:todolist_application/provider/taskProvider.dart';
import 'package:todolist_application/widgets/Button.dart';
import 'package:todolist_application/widgets/Dialog.dart';
import 'package:todolist_application/provider/cached.dart';

class TaskBuilder extends StatelessWidget {
  TaskBuilder();
  final TextEditingController _textFieldController = TextEditingController();
  Widget build(BuildContext context) {
    final taskProvier = context.watch<TaskProvier>();
    return Column(
      children: <Widget>[
        CustomButtom(
          iconDataMatetial: context.platformIcons.add,
          iconDataCupertino: context.platformIcons.add,
          onAddClick: () {
            _displayDialog(context);
          },
        ),
        Expanded(
            child: ListView.builder(
                itemCount: taskProvier.getLength(),
                itemBuilder: (context, index) {
                  final todoTaskItem = taskProvier.getTaskByIndex(index);
                  final todoItemName = todoTaskItem.gettaskname();
                  return Dismissible(
                      key: Key(todoItemName),
                      onDismissed: (direction) {
                        taskProvier.onDeleteTask(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$todoItemName dismissed')));
                      },
                      background: Container(color: Colors.red),
                      child: CheckboxListTile(
                          activeColor: Colors.blue[300],
                          dense: true,
                          title: new Text(
                            todoItemName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                decoration: (todoTaskItem.isdone()
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none)),
                          ),
                          value: todoTaskItem.isdone(),
                          onChanged: (_) {
                            taskProvier.onToogleTask(todoTaskItem);
                          }));
                }) // add items to the to-do list
            ),
      ],
    );
  }

  Future<PlatformAlertDialog> _displayDialog(
    BuildContext context,
  ) async {
    final taskProvier = context.read<TaskProvier>();
    final cachedDataProvier = Provider.of<CachedData>(context, listen: false);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            title: cachedDataProvier.dialogTitle,
            content: PlatformTextField(
                material: (_, __) => MaterialTextFieldData(
                    autofocus: true,
                    controller: _textFieldController,
                    decoration:
                        InputDecoration(hintText: cachedDataProvier.hint)),
                cupertino: (_, __) => CupertinoTextFieldData(
                    autofocus: true,
                    controller: _textFieldController,
                    decoration: const BoxDecoration())),
            platformACtionDialogList: [
              PlatformDialogAction(
                  child: PlatformText(cachedDataProvier.add,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  onPressed: () {
                    taskProvier.addTodoItem(_textFieldController.text);
                    Navigator.of(context).pop();
                    _textFieldController.clear();
                  }),

              // Cancel button
              PlatformDialogAction(
                child: PlatformText(
                  cachedDataProvier.cancel,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }
}

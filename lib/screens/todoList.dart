import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:todolist_application/model/task.dart';
import 'package:todolist_application/widgets/Button.dart';
import 'package:todolist_application/widgets/Dialog.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // save data
  final List<Task> _todoList = <Task>[];
  // text field
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  final todoItemName = _todoList[index].gettaskname();
                  return Dismissible(
                      key: Key(todoItemName),
                      onDismissed: (direction) {
                        setState(() {
                          _todoList.removeAt(index);
                        });

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
                                decoration: (_todoList[index].isdone()
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none)),
                          ),
                          value: _todoList[index].isdone(),
                          onChanged: (_) {
                            _onToogleTask(_todoList[index]);
                          }));
                }) // add items to the to-do list
            ),
      ],
    );
  }

  void _addTodoItem(String title) {
    setState(() {
      _todoList.add(Task(title));
    });
    _textFieldController.clear();
  }

  void _onToogleTask(Task task) {
    setState(() {
      task.setdone(!task.isdone());
    });
  }

  Future<PlatformAlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            title: 'Add a task to your list',
            content: PlatformTextField(
                material: (_, __) => MaterialTextFieldData(
                    autofocus: true,
                    controller: _textFieldController,
                    decoration:
                        const InputDecoration(hintText: 'Enter task here')),
                cupertino: (_, __) => CupertinoTextFieldData(
                    autofocus: true,
                    controller: _textFieldController,
                    decoration: const BoxDecoration())),
            platformACtionDialogList: [
              PlatformDialogAction(
                child: PlatformText('ADD',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              ),

              // Cancel button
              PlatformDialogAction(
                child: PlatformText(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
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

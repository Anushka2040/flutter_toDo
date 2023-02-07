import 'dart:html';

import 'package:assignment_gyizer/models/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        child: Container(
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(197, 0, 0, 0),
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Row(children: [
                      Text(
                        todo.todoText!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(169, 255, 255, 255),
                        ),
                      ),
                    ]),
                    Row(children: [
                      Text(
                        todo.todoAbout!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(169, 255, 255, 255),
                        ),
                      ),
                    ]),
                  ]),
                  Container(
                    padding: const EdgeInsets.only(bottom: 2),
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.orange[400],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      color: Colors.white,
                      iconSize: 18,
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            child: Container(
                                width: MediaQuery.of(context).size.width - 200,
                                height:
                                    MediaQuery.of(context).size.height - 300,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.orange)),
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text(
                                          'Are you sure you want to delete? ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  169, 255, 255, 255)),
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  onDeleteItem(todo.id);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      color: Colors.orange),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'No',
                                                  style: TextStyle(
                                                      color: Colors.orange),
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ))),
                          ),
                        );
                      },
                    ),
                  ),
                ])),
        onTap: () {
          onToDoChanged(todo);
        },
      ),
      Visibility(
          visible: todo.isDone,
          child: Row(children: [
            IconButton(
              color: Colors.orange,
              iconSize: 18,
              icon: const Icon(Icons.edit),
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    child: Container(
                        width: MediaQuery.of(context).size.width - 150,
                        height: MediaQuery.of(context).size.height - 200,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.orange)),
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const TextField(
                                    // controller: _todoControllerMini Input,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 0.0),
                                        ),
                                        hintText: 'Mini Input',
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: InputBorder.none)),
                                const TextField(
                                    // controller: _todoControllertitle,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 0.0),
                                        ),
                                        hintText: 'Mini Input',
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: InputBorder.none)),
                                const SizedBox(height: 15),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                ),
                              ],
                            ))),
                  ),
                );
              },
            ),
            IconButton(
              color: Colors.orange,
              iconSize: 18,
              icon: const Icon(Icons.info),
              onPressed: () {},
            ),
          ]))
    ]);
  }
}

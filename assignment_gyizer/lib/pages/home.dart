import 'dart:html';

import 'package:assignment_gyizer/models/todo.dart';
import 'package:assignment_gyizer/widgets/todo_list_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final _todoControllertitle = TextEditingController();
  final _todoControllerabout = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(title: Text('ToDo App')),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.orange),
                  ),
                  child: TextField(
                      style: const TextStyle(
                          color: Color.fromARGB(169, 255, 255, 255)),
                      controller: _todoControllertitle,
                      decoration: const InputDecoration(
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(169, 255, 255, 255)),
                          border: InputBorder.none)),
                )),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.orange)),
                  child: TextField(
                      controller: _todoControllerabout,
                      style: const TextStyle(
                          color: Color.fromARGB(169, 255, 255, 255)),
                      decoration: const InputDecoration(
                          hintText: 'About',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(169, 255, 255, 255)),
                          border: InputBorder.none)),
                )),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 5,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(
                          _todoControllertitle.text, _todoControllerabout.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              border: ScreenSize > 400
                  ? Border.all(color: Colors.orange)
                  : Border.all(color: Colors.transparent),
              borderRadius: ScreenSize > 400
                  ? BorderRadius.circular(10)
                  : BorderRadius.circular(0),
            ),
            margin: const EdgeInsets.only(top: 87),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(),
                      for (ToDo toDoo in todosList)
                        ToDoItem(
                          todo: toDoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDotitle, String toDoabout) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDotitle,
          todoAbout: toDoabout));
    });
    _todoControllerabout.clear();
    _todoControllertitle.clear();
  }
}

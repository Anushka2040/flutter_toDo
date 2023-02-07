class ToDo {
  String? id;
  String? todoText;
  String? todoAbout;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    required this.todoAbout,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(
          id: '01',
          todoText: 'Morning Exercise',
          todoAbout: 'Lorem Ipsum',
          isDone: false),
    ];
  }
}

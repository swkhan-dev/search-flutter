import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:search_flutter/home_screen.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel() {
    _todos = [
      Todo(text: "Gym Workout", dueDate: DateTime.now()),
      Todo(text: "Homework", dueDate: DateTime.now()),
      Todo(text: "Sports Time", dueDate: DateTime.now()),
      Todo(text: "Bring some food", dueDate: DateTime.now()),
      Todo(text: "Taking a bath in the morning", dueDate: DateTime.now())
    ];
    _filteredTodos = _todos;
    notifyListeners();
  }

  List<Todo> _todos = [];
  List<Todo> _filteredTodos = [];

  List<Todo> get todos => _todos;
  List<Todo> get filteredTodos => _filteredTodos;

  search(String query) {
    log("search executed");
    _filteredTodos = _todos
        .where((todo) => todo.text!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}

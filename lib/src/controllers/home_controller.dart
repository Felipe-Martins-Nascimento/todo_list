import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/todo_model.dart';
import 'package:flutter_application_1/src/repositories/todo_repository.dart';
import 'package:flutter_application_1/src/home_page.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _repository;
  final ValueNotifier<HomeState> state = ValueNotifier(HomeState.start);
  
  HomeController([TodoRepository? repository]) : _repository = repository ?? TodoRepository();

  Future<void> start() async {
    state.value = HomeState.loading;
    final Map<int, bool> previousCompletedMap = {
      for (var todo in todos) 
        if (todo.id != null) todo.id!: todo.completed ?? false,
    };

    try {
      todos = await _repository.fetchTodos();
      for (var todo in todos) {
        if (previousCompletedMap.containsKey(todo.id)) {
          todo.completed = previousCompletedMap[todo.id];
        }
      }
      state.value = HomeState.success;
    } 
    catch (_) {
      state.value = HomeState.error;
    } 
  }
}
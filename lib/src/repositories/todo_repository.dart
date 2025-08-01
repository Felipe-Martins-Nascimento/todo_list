import 'package:dio/dio.dart';
import '../models/todo_model.dart';

class TodoRepository {
  final Dio dio;
  final String url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository({Dio? client}) : dio = client ?? Dio();

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;
    return list.map((json) => TodoModel.fromJson(json)).toList();
  }
}
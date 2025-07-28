import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:todo_bloc/bloc/todo_event.dart';
import 'package:todo_bloc/bloc/todo_state.dart';
import 'package:todo_bloc/modal/todo_modal.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<FetchTodos>((event, emit) async {
      emit(TodoLoading());
      try {
        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
        if (response.statusCode == 200) {
          final List data = json.decode(response.body);
          final todos = data.map((e) => Todo.fromJson(e)).toList();
          emit(TodoLoaded(todos));
        } else {
          emit(TodoError('Failed to load data'));
        }
      } catch (e) {
        emit(TodoError('Something went wrong'));
      }
    });
  }
}

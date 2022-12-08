import 'package:mobx/mobx.dart';
part 'todo_store.g.dart';

// ignore: library_private_types_in_public_api
class ToDoStore = _ToDoStore with _$ToDoStore;

abstract class _ToDoStore with Store {

  _ToDoStore(this.title);

  final String title;

  @observable
  bool done = false;
  
  @action
  void toggleDone() => done = !done;
}
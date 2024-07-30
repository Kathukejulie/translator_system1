import 'package:rxdart/rxdart.dart';

class SelectedUserController {
  final _selectedUserBehaviorSubject = BehaviorSubject<String>.seeded("");

  Stream<String> get selectedTranslatorStream =>
      _selectedUserBehaviorSubject.stream;

  void saveUser(id) => _selectedUserBehaviorSubject.sink.add(id);
  
}

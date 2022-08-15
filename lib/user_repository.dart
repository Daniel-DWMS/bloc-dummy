import 'package:bloc_dummy/user.dart';

class UserRepository {

  Future<User> fetchUserById(String id) async {
    return User(id: id, userName: "John Doe", email: "john.doe@gmail.com");
  }
}
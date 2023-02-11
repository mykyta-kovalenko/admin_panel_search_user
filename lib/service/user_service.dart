import 'package:injectable/injectable.dart';

import '../mocks/dummy_data.dart';
import '../models/user.dart';

/// A class that provides access to the user data.
@injectable
class UserService {
  final DummyData dummyData;

  UserService(this.dummyData);

  List<User> getUsers() => dummyData.users;
}

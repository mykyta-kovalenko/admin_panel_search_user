import 'package:injectable/injectable.dart';

import '../mocks/dummy_data.dart';
import '../models/user.dart';

@injectable
class UserService {
  final DummyData dummyData;

  UserService(this.dummyData);

  List<User> getUsers() => dummyData.users;
}

import 'package:injectable/injectable.dart';

import '../gen/assets.gen.dart';
import '../models/user.dart';

@injectable
class DummyData {
  List<User> users = [
    User(
      id: '0',
      firstName: 'Joanne',
      lastName: 'Robinson',
      photo: Assets.images.joanneRobinson.path,
      registrationDate: '11/25/2019',
      isOnline: true,
    ),
    User(
      id: '1',
      firstName: 'Joe',
      lastName: 'Mike',
      photo: Assets.images.joeMike.path,
      registrationDate: '11/25/2019',
      isOnline: true,
    ),
    User(
      id: '2',
      firstName: 'John',
      lastName: 'Jameson',
      photo: Assets.images.johnJameson.path,
      registrationDate: '11/25/2019',
      isOnline: false,
    ),
    User(
      id: '3',
      firstName: 'John',
      lastName: 'Johnson',
      photo: Assets.images.johnJohnson.path,
      registrationDate: '11/25/2019',
      isOnline: true,
    ),
    User(
      id: '4',
      firstName: 'Joseph',
      lastName: 'Smith',
      photo: Assets.images.josephSmith.path,
      registrationDate: '11/25/2019',
      isOnline: true,
    ),
  ];
}

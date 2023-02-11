import 'package:injectable/injectable.dart';

import '../gen/assets.gen.dart';
import '../models/user.dart';

@injectable
class DummyData {
  List<User> users = [
    //TODO: Move all strings to resources.
    User(
      id: '0',
      fullName: 'Joanne Robinson',
      photo: Assets.images.joanneRobinson.path,
      registrationDate: '11/25/2019',
      isOnline: true,
    ),
    User(
      id: '1',
      fullName: 'Joe Mike',
      photo: Assets.images.joeMike.path,
      registrationDate: '11/25/2019',
      isOnline: true,
    ),
    User(
      id: '2',
      fullName: 'John Jameson',
      photo: Assets.images.johnJameson.path,
      registrationDate: '11/25/2019',
      isOnline: false,
    ),
    User(
      id: '3',
      fullName: 'John Johnson',
      photo: Assets.images.johnJohnson.path,
      registrationDate: '11/25/2019',
      isOnline: true,
    ),
    User(
      id: '4',
      fullName: 'Joseph Smith',
      photo: Assets.images.josephSmith.path,
      registrationDate: '11/25/2019',
      isOnline: true,
    ),
  ];
}

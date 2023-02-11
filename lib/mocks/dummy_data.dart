import 'package:injectable/injectable.dart';

import '../gen/assets.gen.dart';
import '../models/user.dart';
import '../resources/app_strings.dart';

/// Hard-coded users data.
@injectable
class DummyData {
  List<User> users = [
    User(
      id: '0',
      fullName: AppStrings.joanneRobinson,
      photo: Assets.images.joanneRobinson.path,
      registrationDate: AppStrings.registrationDate,
      isOnline: true,
    ),
    User(
      id: '1',
      fullName: AppStrings.joeMike,
      photo: Assets.images.joeMike.path,
      registrationDate: AppStrings.registrationDate,
      isOnline: true,
    ),
    User(
      id: '2',
      fullName: AppStrings.johnJameson,
      photo: Assets.images.johnJameson.path,
      registrationDate: AppStrings.registrationDate,
      isOnline: false,
    ),
    User(
      id: '3',
      fullName: AppStrings.johnJohnson,
      photo: Assets.images.johnJohnson.path,
      registrationDate: AppStrings.registrationDate,
      isOnline: true,
    ),
    User(
      id: '4',
      fullName: AppStrings.josephSmith,
      photo: Assets.images.josephSmith.path,
      registrationDate: AppStrings.registrationDate,
      isOnline: true,
    ),
  ];
}

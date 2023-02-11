import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../models/user.dart';
import '../../service/user_service.dart';
import '../core/base_cubit.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends BaseCubit<SearchState> {
  final UserService userService;

  SearchCubit(this.userService) : super(const SearchState());

  Future<void> init() async {
    await performSafeAction(() async {
      emit(state.copyWith(
        users: userService.getUsers(),
      ));
    });
  }

  Future<void> searchUsers(String query) async {
    emit(const SearchState(status: SearchStatus.loading));

    if (query.isEmpty) {
      emit(state.copyWith(
        filteredUsers: [],
        status: SearchStatus.success,
      ));
      return;
    }

    if (query.length < 2) return;

    performSafeAction(() async {
      final users = userService.getUsers();
      final filteredUsers = users.where((user) {
        return user.fullName.toLowerCase().contains(query.toLowerCase());
      }).toList();

      emit(state.copyWith(
        filteredUsers: filteredUsers,
        status: SearchStatus.success,
      ));
    });
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: SearchStatus.error,
      errorMessage: errorMessage,
    ));
  }
}

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../models/user.dart';
import '../../service/user_service.dart';
import '../core/base_cubit.dart';

part 'search_state.dart';

/// Class for managing search-related state in the application.
@injectable
class SearchCubit extends BaseCubit<SearchState> {
  final UserService userService;

  SearchCubit(this.userService) : super(const SearchState());

  /// This method is used to search for users based on the given query.
  /// It updates the state of the cubit by emitting new state objects.
  Future<void> searchUsers(String query) async {
    emit(const SearchState(status: SearchStatus.loading));

    /// If the query is empty, emit a new state object with the filteredUsers
    /// list set to an empty list and the status set to success.
    if (query.isEmpty) {
      emit(state.copyWith(
        filteredUsers: [],
        status: SearchStatus.success,
      ));
      return;
    }

    /// If the query length is less than 2,
    /// return without emitting a new state object.
    if (query.length < 2) return;

    /// Main logic. Retrieve the list of users using.
    /// Then, using the where method, filter the list to contain only users
    /// whose full name contains the query.
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

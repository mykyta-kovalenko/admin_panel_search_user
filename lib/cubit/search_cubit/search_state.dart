part of 'search_cubit.dart';

enum SearchStatus {
  loading,
  success,
  error,
}

/// This class is a state object that is used to store the status, users,
/// filtered users, and error message of the search process.
class SearchState extends Equatable {
  final SearchStatus status;
  final List<User> users;
  final List<User> filteredUsers;
  final String errorMessage;

  const SearchState({
    this.status = SearchStatus.success,
    this.users = const [],
    this.filteredUsers = const [],
    this.errorMessage = '',
  });

  SearchState copyWith({
    SearchStatus? status,
    List<User>? users,
    List<User>? filteredUsers,
    String? errorMessage,
  }) {
    return SearchState(
      status: status ?? this.status,
      users: users ?? this.users,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        users,
        filteredUsers,
        errorMessage,
      ];
}

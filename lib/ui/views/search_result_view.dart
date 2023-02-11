import 'package:flutter/material.dart';

import '../../cubit/search_cubit/search_cubit.dart';
import '../../models/user.dart';
import '../../themes/main_theme.dart';

const _maxCapacity = 20;

class SearchResultView extends StatelessWidget {
  final ValueSetter<User> onPressedUser;
  final SearchState state;

  const SearchResultView({
    super.key,
    required this.onPressedUser,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    /// Show no more than 20 users, in order to not overload memory
    final itemCount = state.filteredUsers.length > _maxCapacity
        ? _maxCapacity
        : state.filteredUsers.length;

    if (state.status == SearchStatus.loading) {
      return const CircularProgressIndicator();
    }

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: ((context, index) {
        return Text(
          state.filteredUsers[index].firstName,
          style: MainTheme.text(context).defaultText,
        );
      }),
    );
  }
}

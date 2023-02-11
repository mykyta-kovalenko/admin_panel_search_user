import 'package:flutter/material.dart';

import '../../cubit/search_cubit/search_cubit.dart';
import '../../models/user.dart';
import '../../themes/main_theme.dart';
import 'user_tile.dart';

const _maxCapacity = 20;

class SearchResultView extends StatelessWidget {
  final SearchState state;
  final ValueSetter<User> onPressedUser;
  final ValueNotifier<String> inputNotifier;

  const SearchResultView({
    super.key,
    required this.state,
    required this.onPressedUser,
    required this.inputNotifier,
  });

  @override
  Widget build(BuildContext context) {
    /// Show no more than 20 users, for scrolling convenience
    final itemCount = state.filteredUsers.length > _maxCapacity
        ? _maxCapacity
        : state.filteredUsers.length;

    if (state.status == SearchStatus.loading) {
      return Center(
        child: CircularProgressIndicator(
          color: MainTheme.color(context).systemBlue,
        ),
      );
    }

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (_, index) => _buildItem(index),
    );
  }

  _buildItem(int index) {
    final user = state.filteredUsers[index];

    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: UserTile(
        inputNotifier: inputNotifier,
        user: user,
        onPressed: () => onPressedUser(user),
      ),
    );
  }
}

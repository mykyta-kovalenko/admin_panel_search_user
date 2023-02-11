import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../models/user.dart';
import '../../resources/app_strings.dart';
import '../../themes/main_theme.dart';
import 'rich_text_search.dart';

/// This widget is used to display information about a user.
/// The class provides a compact and visually appealing
/// representation of a user's information, including their photo,
/// full name, and registration date.
class UserTile extends StatelessWidget {
  final User user;
  final VoidCallback onPressed;
  final ValueNotifier<String> inputNotifier;

  const UserTile({
    super.key,
    required this.user,
    required this.onPressed,
    required this.inputNotifier,
  });

  @override
  Widget build(BuildContext context) {
    final photo = user.photo;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          if (photo.isNotEmpty) _buildPhoto(context, photo),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFullName(context),
                const SizedBox(height: 10),
                _buildRegistrationDate(context),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            // Inactive due to task purproses
            onTap: () {},
            child: Image.asset(Assets.images.bitmap.path),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoto(BuildContext context, String photo) {
    return Stack(
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: Image.asset(
            photo,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) {
              return const SizedBox(
                width: 70,
                height: 70,
              );
            },
          ),
        ),
        Container(
          width: 70,
          height: 67,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 3,
              color: user.isOnline
                  ? MainTheme.color(context).statusGreen
                  : MainTheme.color(context).statusRed,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFullName(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichTextSearch(
          text: user.fullName,
          inputNotifier: inputNotifier,
        ),
      ],
    );
  }

  Widget _buildRegistrationDate(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.memberSince,
          style: MainTheme.text(context).defaultText,
        ),
        const SizedBox(width: 4),
        Text(
          user.registrationDate,
          style: MainTheme.text(context).defaultText,
        ),
      ],
    );
  }
}

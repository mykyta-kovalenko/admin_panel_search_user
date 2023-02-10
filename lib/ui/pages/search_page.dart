import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_strings.dart';
import '../../themes/main_theme.dart';

enum SearchTabFields { search }

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late ValueNotifier<String> _inputNotifier;
  late TextEditingController _searchBarController;

  MainTextThemeData get _textTheme => MainTheme.text(context);
  MainColorThemeData get _colorTheme => MainTheme.color(context);

  @override
  void initState() {
    super.initState();
    _searchBarController = TextEditingController();
    _inputNotifier = ValueNotifier<String>(_searchBarController.text.trim());
    _searchBarController.addListener(() {
      _inputNotifier.value = _searchBarController.text.trim();
    });
  }

  @override
  void dispose() {
    _inputNotifier.dispose();
    _searchBarController.dispose();
    super.dispose();
  }

  ValueListenableBuilder<String> _getTextCanceler(Widget cancel) {
    return ValueListenableBuilder<String>(
      valueListenable: _inputNotifier,
      builder: (context, value, _) {
        return value.isNotEmpty ? cancel : const SizedBox.shrink();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildAppBar(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        _buildIcon(Assets.svg.backButton),
        const Spacer(),
        const Text(AppStrings.addAnAdmin),
        const Spacer(),
        _buildIcon(Assets.svg.pureMatchLogo),
      ],
    );
  }

  Widget _buildBody() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildSearchField()),
              _getTextCanceler(_buildCancelTextButton()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String iconPath) {
    return GestureDetector(
      /// Inactive due to task purproses
      onTap: () {},
      child: SizedBox(
        height: 37,
        width: 37,
        child: SvgPicture.asset(
          iconPath,
          fit: BoxFit.none,
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: FormBuilderTextField(
        showCursor: false,
        style: _textTheme.searchField,
        controller: _searchBarController,
        name: SearchTabFields.search.name,
        textInputAction: TextInputAction.go,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          hintText: AppStrings.searchForAUser,
          suffixIcon: _getTextCanceler(_buildCancelIconButton()),
          prefixIconConstraints: const BoxConstraints(maxWidth: 40),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 8, right: 4),
            child: Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  Widget _buildCancelTextButton() {
    return TextButton(
      onPressed: _searchBarController.clear,
      child: Text(
        AppStrings.cancel,
        style: _textTheme.cancel,
      ),
    );
  }

  Widget _buildCancelIconButton() {
    return IconButton(
      padding: const EdgeInsets.all(0),
      onPressed: _searchBarController.clear,
      icon: Icon(
        Icons.cancel_rounded,
        color: _colorTheme.grey.withOpacity(0.6),
      ),
    );
  }
}

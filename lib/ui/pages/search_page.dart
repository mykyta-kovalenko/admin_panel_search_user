import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';

import '../../cubit/search_cubit/search_cubit.dart';
import '../../di/di.dart';
import '../../gen/assets.gen.dart';
import '../../resources/app_strings.dart';
import '../../themes/main_theme.dart';
import '../views/search_result_view.dart';

/// The SearchPage class is a StatefulWidget that provides a search
/// functionality to its users. The user can search for other users
/// by entering the name of the user they are looking for.
/// The page consists of an AppBar at the top and a body which contains
/// the search bar and the search result.

enum SearchTabFields { search }

class SearchPage extends StatefulWidget {
  static Widget create() {
    return BlocProvider(
      create: (context) => locator.get<SearchCubit>(),
      child: const SearchPage(),
    );
  }

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late ValueNotifier<String> _inputNotifier;
  late TextEditingController _searchBarController;

  DateTime _lastInputTimeStamp = DateTime.now();

  SearchCubit get _searchCubit => context.read<SearchCubit>();
  MainTextThemeData get _textTheme => MainTheme.text(context);
  MainColorThemeData get _colorTheme => MainTheme.color(context);

  @override
  void initState() {
    super.initState();
    _searchBarController = TextEditingController();
    _inputNotifier = ValueNotifier<String>(_searchBarController.text.trim());
    _searchBarController.addListener(() {
      _inputNotifier.value = _searchBarController.text.trim();
      _tryToGetUsers(_inputNotifier.value);
    });
  }

  @override
  void dispose() {
    _inputNotifier.dispose();
    _searchBarController.dispose();
    super.dispose();
  }

  Future<void> _tryToGetUsers(String query) async {
    final timestamp = _lastInputTimeStamp = DateTime.now();

    await Future.delayed(const Duration(milliseconds: 700), () {
      if (timestamp != _lastInputTimeStamp) return;

      _searchCubit.searchUsers(query);
    });
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
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: _buildSearchField()),
                  _getTextCanceler(_buildCancelTextButton()),
                ],
              ),
              const SizedBox(height: 13),
              Expanded(
                child: SearchResultView(
                  onPressedUser: (_) {},
                  state: state,
                  inputNotifier: _inputNotifier,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildIcon(String iconPath) {
    return GestureDetector(
      // Inactive due to task purproses
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
        key: Key(SearchTabFields.search.name),
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

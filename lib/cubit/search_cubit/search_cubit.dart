import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../core/base_cubit.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends BaseCubit<SearchState> {
  SearchCubit() : super(const SearchState());

  @override
  void handleError(String errorMessage) {
    // TODO: implement handleError
  }
}

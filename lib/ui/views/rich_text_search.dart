import 'package:flutter/material.dart';

import '../../themes/main_theme.dart';

/// Class for creating a RichText widget that
/// highlights a search term within a given text.
class RichTextSearch extends StatefulWidget {
  final String text;
  final ValueNotifier<String> inputNotifier;

  const RichTextSearch({
    super.key,
    required this.text,
    required this.inputNotifier,
  });

  @override
  State<RichTextSearch> createState() => _RichTextSearchState();
}

class _RichTextSearchState extends State<RichTextSearch> {
  late String searchTerm;

  @override
  void initState() {
    super.initState();
    searchTerm = widget.inputNotifier.value;
    widget.inputNotifier.addListener(() {
      searchTerm = widget.inputNotifier.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> textSpans = [];

    int searchTermIndex = widget.text.indexOf(searchTerm);

    if (searchTermIndex != -1) {
      textSpans.add(
        TextSpan(
          text: widget.text.substring(0, searchTermIndex),
        ),
      );
      textSpans.add(
        TextSpan(
          text: widget.text.substring(
            searchTermIndex,
            searchTermIndex + searchTerm.length,
          ),
          style: MainTheme.text(context).demiboldText,
        ),
      );
      textSpans.add(
        TextSpan(
          text: widget.text.substring(searchTermIndex + searchTerm.length),
          style: MainTheme.text(context).defaultText.copyWith(fontSize: 16),
        ),
      );
    } else {
      textSpans.add(TextSpan(text: widget.text));
    }

    return RichText(
      text: TextSpan(
        children: textSpans,
      ),
    );
  }
}

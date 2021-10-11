import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.controller,
    required this.searchFocus,
    required this.searchText,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode searchFocus;
  final void Function(String) searchText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: const Icon(Icons.search),
          title: TextField(
            controller: controller,
            focusNode: searchFocus,
            decoration: const InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
            ),
            onChanged: searchText,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              searchText('');
              searchFocus.unfocus();
            },
          ),
        ),
      ),
    );
  }
}

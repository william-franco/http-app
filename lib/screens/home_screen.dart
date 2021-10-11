import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http_app/models/user_model.dart';
import 'package:http_app/services/user_service.dart';
import 'package:http_app/widgets/list_widget.dart';
import 'package:http_app/widgets/loading_list_widget.dart';
import 'package:http_app/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final String title = 'Http App';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _textController = TextEditingController();
  final _searchFocus = FocusNode();

  final List<UserModel> _searchUsers = [];
  final List<UserModel> _users = [];

  bool _showWidget = true;
  bool isScrollingDown = false;
  bool show = true;
  bool _loading = true;

  Future<void> _initUsers() async {
    _users.clear();
    await HttpService.getAllUsers().then((items) {
      setState(() {
        for (var item in items) {
          _users.add(item);
        }
        _loading = false;
      });
    });
  }

  void _searchText(String text) async {
    _searchUsers.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    for (var userDetail in _users) {
      if (userDetail.firstName.contains(text) ||
          userDetail.lastName.contains(text)) _searchUsers.add(userDetail);
    }
    setState(() {});
  }

  void _customScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showWidget = false;
          setState(() => show = false);
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showWidget = true;
          setState(() => show = true);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _customScroll();
    _initUsers();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      top: true,
      child: Column(
        children: <Widget>[
          _showWidget
              ? SearchWidget(
                  controller: _textController,
                  searchFocus: _searchFocus,
                  searchText: _searchText,
                )
              : Container(),
          _loading
              ? const LoadingListWidget()
              : _searchUsers.isNotEmpty || _textController.text.isNotEmpty
                  ? Expanded(
                      child: ListWidget(
                        users: _searchUsers,
                        scroll: _scrollController,
                      ),
                    )
                  : Expanded(
                      child: RefreshIndicator(
                        onRefresh: _initUsers,
                        child: ListWidget(
                          users: _users,
                          scroll: _scrollController,
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}

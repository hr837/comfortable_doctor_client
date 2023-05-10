import 'package:comfortable_client/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeActionUname extends StatefulWidget {
  /// 当获取用户信息失败的时候
  final VoidCallback onLoadFaild;
  const HomeActionUname({super.key, required this.onLoadFaild});

  @override
  State<HomeActionUname> createState() => __HomeActionUnameState();
}

class __HomeActionUnameState extends State<HomeActionUname> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    loadUserName();
  }

  /// 加载登录用户名
  void loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(STORE_KEY_USERNAME);
    if (value != null) {
      setState(() {
        userName = value;
      });
    } else {
      widget.onLoadFaild();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(userName));
  }
}

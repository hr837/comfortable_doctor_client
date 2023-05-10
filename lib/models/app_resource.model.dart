import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/constant.dart';

/// App运行所需资源集合
class AppResourceModel extends ChangeNotifier with DiagnosticableTreeMixin {
  final Future<SharedPreferences> _spf = SharedPreferences.getInstance();

  String _url = '';
  AppResourceModel() {
    _spf.then((value) => _url = value.getString(STORE_KEY_URL) ?? '');
  }

  /// 服务器地址
  String get urlBase => _url;

  /// 更新服务请求地址
  void updateUrl(String url) {
    _url = url;
    // 更新到本地缓存
    _spf.then((value) => value.setString(STORE_KEY_URL, url));
    // 通知改变
    notifyListeners();
  }
}

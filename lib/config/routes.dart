import 'package:comfortable_client/views/home/home_view.dart';
import 'package:comfortable_client/views/login/login_view.dart';
import 'package:flutter/widgets.dart';

/// 系统路由
final routes = {
  '/': (BuildContext context) => const HomeView(),
  '/login': (BuildContext context) => const LoginView(),
};

/// 默认路由
const defaultRoute = '/login';

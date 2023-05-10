import 'package:flutter/cupertino.dart';

import 'components/login_form.dart';
import 'components/login_logo.dart';
import 'components/login_operate_room.dart';
import 'components/login_server_setting.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('用户登录'),
        trailing: SafeArea(
          child: SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                LoginOperateRoom(),
                LoginServerSetting(),
              ],
            ),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              LoginLogo(),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

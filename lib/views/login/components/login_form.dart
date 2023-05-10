import 'package:flutter/cupertino.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _pwdFocusNode = FocusNode();

  bool _showPwd = false;

  final inputBoxDecoration = const CupertinoTextField().decoration;

  String _uname = '';
  String _upwd = '';

  void onSeePwd() {
    if (!_showPwd) {
      setState(() {
        _showPwd = true;
      });
      // 2s 后隐藏密码
      Future.delayed(
        const Duration(seconds: 2),
        () => setState(() {
          _showPwd = false;
        }),
      );
    }
  }

  // void login() {}

  Icon seePwdIcon = const Icon(
    CupertinoIcons.eye_fill,
    color: CupertinoColors.inactiveGray,
    size: 18,
  );
  Icon hienPwdIcon = const Icon(
    CupertinoIcons.eye_slash_fill,
    color: CupertinoColors.inactiveGray,
    size: 18,
  );

  void onSubmit() {
    var validated = _formKey.currentState!.validate();
    if (validated) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(CupertinoIcons.person_fill),
                ),
                Expanded(
                  child: CupertinoTextFormFieldRow(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    placeholder: '用户名',
                    decoration: inputBoxDecoration,
                    style: const TextStyle(
                      height: 1.5,
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? '请输入登录用户名'
                        : null,
                    onSaved: (val) => {
                      setState(() => {_uname = val ?? ""})
                    },
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(CupertinoIcons.lock_fill),
                ),
                Expanded(
                  child: CupertinoTextFormFieldRow(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    placeholder: '密码',
                    obscureText: true,
                    decoration: inputBoxDecoration,
                    style: const TextStyle(
                      height: 1.5,
                    ),
                    focusNode: _pwdFocusNode,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? '请输入登录密码'
                        : null,
                    onSaved: (val) => {
                      setState(() => {_upwd = val ?? ""})
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 0, 32),
              child: CupertinoButton.filled(
                onPressed: onSubmit,
                child: const Text(
                  '登录',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

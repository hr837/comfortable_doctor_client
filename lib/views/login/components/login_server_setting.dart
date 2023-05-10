import 'package:comfortable_client/models/app_resource.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginServerSetting extends StatefulWidget {
  const LoginServerSetting({
    super.key,
  });

  @override
  State<LoginServerSetting> createState() => _LoginServerSettingState();
}

class _LoginServerSettingState extends State<LoginServerSetting> {
  late TextEditingController _controller;
  late AppResourceModel _resource;
  bool _showError = false;
  final RegExp _urlExp = RegExp(r"^((https|http)?://)[^\s]+");

  @override
  void initState() {
    super.initState();
    _resource = context.read<AppResourceModel>();
    _controller = TextEditingController(text: _resource.urlBase);
  }

  void onDialogConfirm() {
    bool matched = _urlExp.hasMatch(_controller.text);
    if (matched) {
      _resource.updateUrl(_controller.text);
      Navigator.pop(context);
      // widget.onSave(_controller.text);
    } else {
      setState(() {
        _showError = false;
      });
    }
  }

  void onDialogCancel() {
    Navigator.pop(context);
    _controller.text = _resource.urlBase;
  }

  Widget buildDialogContent() {
    return CupertinoFormRow(
      error: _showError ? const Text('无效的URL') : null,
      padding: EdgeInsets.zero,
      child: CupertinoTextField(
        controller: _controller,
        clearButtonMode: OverlayVisibilityMode.editing,
        style: const TextStyle(
          height: 1.2,
        ),
        placeholder: '服务器地址',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 8),
      onPressed: () => showCupertinoDialog(
        context: context,
        builder: (builder) => CupertinoAlertDialog(
          title: const Text('服务器地址配置'),
          content: buildDialogContent(),
          actions: [
            CupertinoDialogAction(
              onPressed: onDialogCancel,
              child: const Text('取消'),
            ),
            CupertinoDialogAction(
              onPressed: onDialogConfirm,
              child: const Text('确定'),
            ),
          ],
        ),
      ),
      child: const Icon(CupertinoIcons.gear_alt),
    );
  }
}

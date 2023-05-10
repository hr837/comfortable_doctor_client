import 'package:flutter/cupertino.dart';

class LoginOperateRoom extends StatefulWidget {
  const LoginOperateRoom({super.key});

  @override
  State<LoginOperateRoom> createState() => _LoginOperateRoomState();
}

class _LoginOperateRoomState extends State<LoginOperateRoom> {
  String roomValue = 'ORM1';

  final List<String> _rooms = [
    "ORM1",
    "ORM2",
    "ORM3",
    "ORM4",
    "ORM5",
  ];

  void onValueChange(int index) {
    setState(() {
      roomValue = _rooms[index];
    });
  }

  Widget roomPicker() {
    return CupertinoPicker(
      backgroundColor: CupertinoColors.systemBackground,
      onSelectedItemChanged: onValueChange,
      itemExtent: 32,
      children: List.generate(
        _rooms.length,
        (index) => Center(
          child: Text(_rooms[index]),
        ),
      ),
    );
  }

  void showDialog() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext builder) => SizedBox(
        height: 300,
        child: SafeArea(child: roomPicker()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      onPressed: showDialog,
      child: Text(
        roomValue,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}

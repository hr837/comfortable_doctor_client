import 'package:flutter/cupertino.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String appTitle = '首页';

  @override
  Widget build(BuildContext context) {
    goToLogin() => Navigator.of(context).pushReplacementNamed('/login');

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(appTitle),
        trailing: CupertinoButton(
          onPressed: goToLogin,
          child: const Icon(CupertinoIcons.square_arrow_left),
        ),
      ),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: const [
          SizedBox(
            width: 200,
            height: 200,
            child: Center(
              child: Text('Menu1'),
            ),
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: Center(
              child: Text('Menu2'),
            ),
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: const Text(APP_NAME),
      //   actions: [
      //     HomeActionUname(onLoadFaild: goToLogin),
      //     HomeActionExit(onPressed: goToLogin),
      //   ],
      // ),
      // body: GridView.count(
      //   crossAxisCount: 3,
      //   crossAxisSpacing: 16,
      //   mainAxisSpacing: 16,
      //   children: const [
      //     SizedBox(
      //       width: 200,
      //       height: 200,
      //       child: Center(
      //         child: Text('Menu1'),
      //       ),
      //     ),
      //     SizedBox(
      //       width: 200,
      //       height: 200,
      //       child: Center(
      //         child: Text('Menu1'),
      //       ),
      //     ),
      //     TextButton(onPressed: null, child: const Text('123'))
      //   ],
      // )
    );
  }
}

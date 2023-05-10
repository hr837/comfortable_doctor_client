import 'package:comfortable_client/config/routes.dart';
import 'package:comfortable_client/models/app_resource.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'config/constant.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppResourceModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: APP_NAME,
      initialRoute: defaultRoute,
      routes: routes,
    );
  }
}

import 'package:comfortable_client/config/constant.dart';
import 'package:flutter/widgets.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      padding: const EdgeInsets.only(top: 40),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'images/logo.png',
          ),
          const Positioned(
            bottom: 60,
            child: Text(
              APP_NAME,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

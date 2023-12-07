import 'package:flutter/material.dart';

import '../../../../core/util/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                AppImages.main_top,
                width: 120,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(AppImages.login_bottom, width: 120),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}

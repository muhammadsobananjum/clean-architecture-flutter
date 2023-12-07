import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/util/constants.dart';


class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          AppConstants.login,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset(AppImages.splash_logo),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
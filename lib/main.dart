import 'package:flutter/material.dart';

import 'injection.dart';
import 'lifebonder_app.dart';






void main() async {
  await configureDependencies(isUnitTest: false);
  runApp(const LifeBonder());
}




import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'core/services/hive/main_box.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;



@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies({bool isUnitTest = false}) async {
  if(isUnitTest){
    getIt.reset();
  }

  await _initHiveBoxes();
  $initGetIt(getIt, environment: isUnitTest ? Environment.test : Environment.dev,);
}

Future<void> _initHiveBoxes({
  String prefixBox = '',
}) async {

  await MainBoxMixin.initHive(prefixBox);
}

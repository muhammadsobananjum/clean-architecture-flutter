

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

import '../common.dart';

extension StringExtension on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  int toInt(){
    return int.tryParse(this) ?? 0 ;
  }


  void toToastError(BuildContext context) {
    try {
      final message = isEmpty ? 'error' : this;

      CherryToast.error(
        enableIconAnimation: false,
        title: const Text('Error'),
        description: Text(message),
      ).show(context);

    } catch (e) {
      log.e('error $e');
    }
  }
  void toToastSuccess(BuildContext context) {
    try {
      final message = isEmpty ? 'success' : this;

      CherryToast.success(
        title: const Text('Congratulations'),
        enableIconAnimation: false,
        description: Text(message),
      ).show(context);
    } catch (e) {
      log.e('error $e');
    }
  }

  void toToastWarning(BuildContext context) {
    try {
      final message = isEmpty ? 'success' : this;
      CherryToast.warning(
        enableIconAnimation: false,
        title: const Text('Warning'),
        description: Text(message),
      ).show(context);
    } catch (e) {
      log.e('error $e');
    }
  }


}

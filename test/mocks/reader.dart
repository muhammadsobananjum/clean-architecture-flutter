import 'dart:io';

String reader(String name) => File('test/mocks/data/$name').readAsStringSync();

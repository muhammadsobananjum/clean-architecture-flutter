import 'package:flutter/material.dart';
import 'package:lifebonder/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:lifebonder/features/auth/domain/repositories/repositories.dart';
import 'package:mockito/annotations.dart';



@GenerateMocks([
  AuthRepository,
  AuthRemoteDataSource,
])
@GenerateNiceMocks([MockSpec<BuildContext>()])
void main() {}

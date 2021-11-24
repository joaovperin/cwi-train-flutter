import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_ui/application/mapper_impl/user_info_mapper_impl.dart';
import 'package:github_ui/application/mapper_impl/user_mapper_impl.dart';
import 'package:github_ui/application/repository_impl/user_repository_dio_http.dart';
import 'package:github_ui/commons/abstractions/app_mapper.dart';
import 'package:github_ui/commons/colors.dart';
import 'package:github_ui/commons/routes.dart';
import 'package:github_ui/domain/user/user.dart';
import 'package:github_ui/domain/user/user_info.dart';
import 'package:github_ui/domain/user/user_repository.dart';

void main() {
  _registerDependencies();
  runApp(const MyApp());
}

void _registerDependencies() {
  GetIt.I.registerSingleton<UserRepository>(const UserRepositoryDioHttp());
  GetIt.I.registerFactory<HttpMapper<GithubUser>>(() => const UserMapperImpl());
  GetIt.I.registerLazySingleton<HttpMapper<GithubUserInfo>>(
      () => const UserInfoMapperImpl());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github UI',
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
      ),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}

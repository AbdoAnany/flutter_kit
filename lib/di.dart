import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_kit/features/auth/presentation/manager/LoginControl.dart';
import 'package:flutter_kit/features/home/presentation/manager/home_bloc/home_bloc.dart';
import 'package:flutter_kit/utils/http/dio_client.dart';
import 'package:flutter_kit/utils/theme/theme.dart';
import 'package:flutter_kit/utils/theme/widget_themes/text_theme.dart';

import 'app.dart';
import 'features/auth/data/remote/data_sources/users_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repo_impl.dart';
import 'features/auth/domain/use_cases/login_use_case.dart';
import 'features/auth/domain/use_cases/logout_use_case.dart';
import 'features/auth/domain/use_cases/register_use_case.dart';
import 'features/auth/helper/AppRoutes.dart';
import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'features/auth/presentation/manager/register_bloc/register_bloc.dart';
import 'firebase_options.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await TDioHelper.init();
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
  sl.registerLazySingleton<TTextTheme>(() => TTextTheme());
 await authSetup();
  //sl.registerLazySingleton<ThemeProvider>(() =>   Provider.of<ThemeProvider>(Get.context, listen: false));

}
systemChrome() => SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.grey));


authSetup(){
  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  final firebaseAuth = sl.get<FirebaseAuth>();
  sl.registerSingleton<AppRoutes>(AppRoutes(firebaseAuth));

  sl.registerSingleton<AuthRepoImpl>(AuthRepoImpl(UsersRemoteDataSource(sl.get<FirebaseAuth>()), sl.get<FirebaseAuth>()),);




  sl.registerFactory<HomeBloc>(() => HomeBloc( LogoutUseCase(sl.get<AuthRepoImpl>()),));
  sl.registerFactory<LoginCubit>(() => LoginCubit());
  sl.registerFactory<LoginControl>(() => LoginControl());
  // sl.registerFactory<LoginBloc>(() => LoginBloc(LoginUseCase(sl.get<AuthRepoImpl>(),)));

  sl.registerFactory<RegisterBloc>(() => RegisterBloc(RegisterUseCase(sl.get<AuthRepoImpl>(),)));

}

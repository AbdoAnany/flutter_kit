import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_kit/utils/constants/sizes.dart';
import 'package:flutter_kit/utils/constants/text_strings.dart';
import 'package:flutter_kit/utils/theme/theme.dart';
import 'package:flutter_kit/utils/theme/widget_themes/text_theme.dart';

import 'di.dart';
import 'features/0-intro/presentation/intro_screen.dart';
import 'features/0-intro/presentation/pages/OnboardingView.dart';
import 'features/0-intro/presentation/pages/SplashScreen.dart';
import 'features/auth/data/repositories/auth_repo_impl.dart';
import 'features/auth/domain/use_cases/logout_use_case.dart';
import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'features/home/presentation/manager/home_bloc/home_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Get {
  static BuildContext get context => navigatorKey.currentContext!;
  static NavigatorState get navigator => navigatorKey.currentState!;

}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          BlocProvider(create: (context) => LoginCubit( )),
          BlocProvider(create: (context) => HomeBloc( LogoutUseCase(sl.get<AuthRepoImpl>()),)),
        ],
        child: Consumer<ThemeProvider>(builder: (context, them, c) {
          them.getThemeMode();
          TSizes.init(context: context);
          return ScreenUtilInit(
              designSize: Size(
                TSizes.uiSW,
                TSizes.uiSH,
              ),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return MaterialApp(
                  builder: (context,w){
                    TTextTheme.init(context,them);
                    return w!;
                  },
                    navigatorKey: navigatorKey,
                    title: TTexts.appName,
                    themeMode: them.themeMode,
                    theme: TAppTheme.lightTheme,
                    darkTheme: TAppTheme.darkTheme,
                    debugShowCheckedModeBanner: false,
                    home: const IntroScreen());
              });
        }));
  }
}
//sbp_0777c39fd3cec540cb5094f21bd1703e4d49012e
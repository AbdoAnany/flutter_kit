import 'package:firebase_auth/firebase_auth.dart';

import '../../home/presentation/pages/Home.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/register_page.dart';

class AppRoutes {
  final FirebaseAuth firebaseAuth;

  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String bookmark = '/bookmark';
  late final String initialRoute;
   late final bool checkIn ;

  AppRoutes(this.firebaseAuth) {
    if (firebaseAuth.currentUser == null) {
      initialRoute = login;
      checkIn=false;
    } else {
      initialRoute = home;
      checkIn=true;
    }
  }

  static get routes => {
        home: (context) => Home(),
        login: (context) => LoginPage(),
        register: (context) => RegisterBlocProvider(),
        // bookmark: (context) => BookmarkPage(),
      };
}

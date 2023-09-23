import 'package:flutter/material.dart';
import 'package:sih_prototype/screens/expert_home.dart';
import 'package:sih_prototype/screens/farmer_ask_page.dart';
import 'package:sih_prototype/screens/farmer_home.dart';
import 'package:sih_prototype/screens/farmer_post_success_page.dart';
import 'package:sih_prototype/screens/farmer_question_page.dart';

import '../../screens/login_screen.dart';
import '../../screens/signup_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case '/farmerhome':
        return MaterialPageRoute(builder: (_) => const FarmerHomeScreen());
      case '/experthome':
        return MaterialPageRoute(builder: (_) => const ExpertHomeScreen());
      case '/farmeraskpage':
        return MaterialPageRoute(builder: (_) => const FarmerAskPage());
      case '/postsuccesspage':
        return MaterialPageRoute(builder: (_) => const PostSuccessPage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}

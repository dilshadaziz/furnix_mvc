import 'package:furnix_store/views/screens/auth/pages/login_screen.dart';
import 'package:furnix_store/views/screens/auth/pages/sign_up_screen.dart';
import 'package:furnix_store/views/screens/on_boarding/pages/on_boarding_1.dart';
import 'package:furnix_store/utils/constants/route_names.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
      name: Go.checkLogedIn,
      path: "/",
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          name: Go.onboarding,
          path: 'onBoarding',
          builder: (context, state) => const OnBoarding1(),
        ),
        GoRoute(
          name: Go.passwordLogin,
          path: "passwordLogin",
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: Go.signUp,
          path: "signUp",
          builder: (context, state) => SignUpScreen(),
        ),
        // GoRoute(
        //     name: Go.home,
        //     path: "home",
        //     builder: (context, state) {
        //       return HomePage(uid: state.pathParameters["uid"]);
        //     }),
      ]),

  // This is how we can pass arguments
  // GoRoute(
  //   name: Go.passwordLogin,
  //   path: "/passwordLogin",
  //   builder: (context, state) =>
  //       LoginScreen(name: state.pathParameters["name"]!),
  // )
]);

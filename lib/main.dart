import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnix_store/bloc_provider_scope.dart';
import 'package:furnix_store/firebase_options.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:furnix_store/dependency_injection.dart' as di;

Future<void> main() async {
  // Todo: Add Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();

  // Todo: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Todo: Initialize Authentication
  // await FacebookAuth.instance.webAndDesktopInitialize(
  //     appId: '973904030711298',
  //     cookie: true,
  //     xfbml: true,
  //     version: 'v20.0', // Specify the Facebook Graph API version
  //   );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    systemStatusBarContrastEnforced: true,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProviderScope();
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnix_store/bloc_provider_scope.dart';
import 'package:furnix_store/firebase_options.dart';
import 'package:furnix_store/dependency_injection.dart' as di;

Future<void> main() async {
  // Todo: Add Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();

  // Todo: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Todo: Initialize Authentication

  // Inject Dependencies
  // await di.init();

  // Orientation setUp
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,

  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProviderScope();
  }
}

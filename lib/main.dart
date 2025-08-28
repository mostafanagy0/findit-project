import 'package:findit/core/di/get_it.dart';
import 'package:findit/core/routing/app_router.dart';
import 'package:findit/core/routing/routes.dart';
import 'package:findit/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  runApp(FinditApp(appRouter: AppRouter()));
}

class FinditApp extends StatelessWidget {
  const FinditApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.loginView,
    );
  }
}

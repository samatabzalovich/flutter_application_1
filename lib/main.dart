import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/error.dart';
import 'package:flutter_application_1/common/widgets/loader.dart';
import 'package:flutter_application_1/features/auth/controller/auth_controller.dart';
import 'package:flutter_application_1/features/landing/screens/landing_screen.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'colors.dart';
import './mobile_layout_screen.dart';
import './utils/responsive_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whatsapp UI',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: AppBarTheme(color: appBarColor)),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return LandingScreen();
              }
              return MobileLayoutScreen();
            },
            error: (error, trace) {
              return ErrorScreen(error: error.toString());
            },
            loading: () => const MobileLayoutScreen()));
  }
}

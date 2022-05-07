import 'package:ecommerce/config/app_pages.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return GetMaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: Utils.messengerKey,
      theme: theme(),
      getPages: AppPages.routes,
      // unknownRoute: GetPage(name: "/notfound", page: () => NotFoundPage()),
      initialRoute: AppPages.initRoute,
      // home: Scaffold(
      //     body: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (snapshot.hasError) {
      //       return const Center(
      //         child: Text('Something went wrong! Please try again!!'),
      //       );
      //     } else if (snapshot.hasData) {
      //       return const HomeScreen();
      //     } else {
      //       return const WelcomePage();
      //     }
      //   },
      // )),
    );
  }
}

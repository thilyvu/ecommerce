import 'package:ecommerce/blocs/blocs.dart';
import 'package:ecommerce/repositories/category/category_repository.dart';
import 'package:ecommerce/repositories/checkout/checkout_reposity.dart';
import 'package:ecommerce/repositories/product/product_repository.dart';
import 'package:ecommerce/screens/auth/Welcome/welcome.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/utils/snackBar.dart';
import 'package:ecommerce/utils/user_preference.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/app_router.dart';
import 'config/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await UserPreferences.init();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(categoryRepository: CategoryRepository())
            ..add(
              LoadCategories(),
            ),
        ),
        BlocProvider(
          create: (_) => ProductBloc(productRepository: ProductRepository())
            ..add(
              LoadProducts(),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        scaffoldMessengerKey: Utils.messengerKey,
        home: Scaffold(
            body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong! Please try again!!'),
              );
            } else if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const WelcomePage();
            }
          },
        )),
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

import 'package:ecommerce/binding/address_binding.dart';
import 'package:ecommerce/binding/cart_binding.dart';
import 'package:ecommerce/binding/category_binding.dart';
import 'package:ecommerce/binding/checkout_binding.dart';
import 'package:ecommerce/binding/product_binding.dart';
import 'package:ecommerce/binding/user_binding.dart';
import 'package:ecommerce/binding/wishlist_binding.dart';
import 'package:ecommerce/screens/address/customer_info.dart';
import 'package:ecommerce/screens/address/list_address.dart';
import 'package:ecommerce/screens/auth/ForgotPass/forgotPass.dart';
import 'package:ecommerce/screens/auth/Login/login.dart';
import 'package:ecommerce/screens/auth/Signup/signup.dart';
import 'package:ecommerce/screens/auth/Welcome/welcome.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:ecommerce/screens/profile/edit_profile.dart';
import 'package:ecommerce/screens/profile/profile.dart';
import 'package:ecommerce/screens/profile/update_password.dart';
import 'package:ecommerce/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final initRoute =
      FirebaseAuth.instance.currentUser != null ? '/home' : '/welcome';

  static final routes = [
    GetPage(
      name: '//welcome',
      page: () => WelcomePage(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: '/forgot-password',
      page: () => ForgotPassPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: '/signUp',
      page: () => SignUpPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: '/cart',
      page: () => CartScreen(),
      bindings: [
        UserBinding(),
        AddressBinding(),
        ProductBinding(),
        CartBinding(),
        WishlistBinding(),
      ],
    ),
    GetPage(
      name: '/catalog/:name',
      page: () => CatalogScreen(),
      bindings: [UserBinding(), ProductBinding(), CategoryBinding()],
    ),
    GetPage(
      name: '/checkout',
      page: () => CheckoutScreen(),
      bindings: [UserBinding(), ProductBinding(), CheckoutBinding()],
    ),
    GetPage(
      name: '/list-address',
      page: () => ListAddressPage(),
      bindings: [UserBinding(), AddressBinding()],
    ),
    GetPage(
      name: '/customer-info',
      page: () => CustomerInfoPage(),
      bindings: [UserBinding(), AddressBinding()],
    ),
    GetPage(
        name: '/home',
        page: () => HomeScreen(),
        bindings: [UserBinding(), ProductBinding(), CategoryBinding()]),
    GetPage(
        name: '/checkout',
        page: () => OrderConfirmation(),
        bindings: [ProductBinding(), CategoryBinding(), AddressBinding()]),
    GetPage(name: '/product/:id', page: () => ProductScreen(), bindings: [
      UserBinding(),
      ProductBinding(),
      CategoryBinding(),
      WishlistBinding(),
      CartBinding()
    ]),
    GetPage(
        name: '/profile',
        page: () => ProfilePage(),
        bindings: [UserBinding(), AddressBinding()]),
    GetPage(
      name: '/profile/password',
      page: () => UpdatePasswordPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: '/profile/update',
      page: () => UpdateProfilePage(),
      binding: UserBinding(),
    ),
    // GetPage(
    //   name: '/splash',
    //   page: () => SplashScreen(),
    // ),
    GetPage(
      name: '/wishlist',
      page: () => WishlistScreen(),
      binding: WishlistBinding(),
    ),
  ];
}

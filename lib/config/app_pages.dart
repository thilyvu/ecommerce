import 'package:ecommerce/binding/address_binding.dart';
import 'package:ecommerce/binding/cart_binding.dart';
import 'package:ecommerce/binding/category_binding.dart';
import 'package:ecommerce/binding/checkout_binding.dart';
import 'package:ecommerce/binding/navigation_binding.dart';
import 'package:ecommerce/binding/product_binding.dart';
import 'package:ecommerce/binding/user_binding.dart';
import 'package:ecommerce/binding/voucher_binding.dart';
import 'package:ecommerce/binding/wishlist_binding.dart';
import 'package:ecommerce/screens/address/customer_info.dart';
import 'package:ecommerce/screens/address/list_address.dart';
import 'package:ecommerce/screens/auth/ForgotPass/forgotPass.dart';
import 'package:ecommerce/screens/auth/Login/login.dart';
import 'package:ecommerce/screens/auth/Signup/signup.dart';
import 'package:ecommerce/screens/auth/Welcome/welcome.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/checkout/checkout_screen.dart';
import 'package:ecommerce/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce/screens/history/history_order_screen.dart';
import 'package:ecommerce/screens/profile/edit_profile.dart';
import 'package:ecommerce/screens/profile/profile.dart';
import 'package:ecommerce/screens/profile/update_password.dart';
import 'package:ecommerce/screens/screens.dart';
import 'package:ecommerce/screens/voucher/voucher_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final initRoute =
      FirebaseAuth.instance.currentUser != null ? '/dashboard' : '/welcome';

  static final routes = [
    GetPage<dynamic>(
        name: '/dashboard',
        page: () => DashboardPage(),
        bindings: [
          NavigationBinding(),
          UserBinding(),
          CheckoutBinding(),
          VoucherBinding(),
          AddressBinding(),
          CategoryBinding(),
          ProductBinding(),
          CartBinding(),
          WishlistBinding(),
        ]),
    GetPage<dynamic>(
      name: '/welcome',
      page: () => WelcomePage(),
    ),
    GetPage<dynamic>(
      name: '/login',
      page: () => LoginPage(),
      binding: UserBinding(),
    ),
    GetPage<dynamic>(
      name: '/history-order',
      page: () => HistoryOrderPage(),
      bindings: [CheckoutBinding()],
    ),
    GetPage<dynamic>(
      name: '/voucher',
      page: () => VoucherPage(),
    ),
    GetPage<dynamic>(
      name: '/forgot-password',
      page: () => ForgotPassPage(),
      binding: UserBinding(),
    ),
    GetPage<dynamic>(
      name: '/signUp',
      page: () => SignUpPage(),
      binding: UserBinding(),
    ),
    GetPage<dynamic>(
      name: '/cart',
      page: () => CartScreen(),
      bindings: [
        VoucherBinding(),
        UserBinding(),
        AddressBinding(),
        ProductBinding(),
        CartBinding(),
      ],
    ),
    GetPage<dynamic>(
      name: '/catalog/:name',
      page: () => CatalogScreen(),
      bindings: [UserBinding(), ProductBinding(), CategoryBinding()],
    ),
    GetPage<dynamic>(
      name: '/list-address',
      page: () => ListAddressPage(),
      bindings: [UserBinding(), CartBinding(), AddressBinding()],
    ),
    GetPage<dynamic>(
      name: '/customer-info',
      page: () => CustomerInfoPage(),
      bindings: [UserBinding(), AddressBinding()],
    ),
    GetPage<dynamic>(name: '/home', page: () => HomeScreen(), bindings: [
      UserBinding(),
      AddressBinding(),
      ProductBinding(),
      CategoryBinding(),
      CartBinding()
    ]),
    GetPage<dynamic>(
        name: '/checkout',
        page: () => CheckOutScreen(),
        bindings: [
          CheckoutBinding(),
          VoucherBinding(),
          ProductBinding(),
          CategoryBinding(),
          AddressBinding(),
        ]),
    GetPage<dynamic>(
        name: '/product/:id',
        page: () => ProductScreen(),
        bindings: [
          UserBinding(),
          ProductBinding(),
          AddressBinding(),
          CategoryBinding(),
          WishlistBinding(),
          CartBinding(),
        ]),
    GetPage<dynamic>(
        name: '/profile',
        page: () => ProfilePage(),
        bindings: [UserBinding(), AddressBinding()]),
    GetPage<dynamic>(
      name: '/profile/password',
      page: () => UpdatePasswordPage(),
      binding: UserBinding(),
    ),
    GetPage<dynamic>(
      name: '/profile/update',
      page: () => UpdateProfilePage(),
      binding: UserBinding(),
    ),
    // GetPage<dynamic>(
    //   name: '/splash',
    //   page: () => SplashScreen(),
    // ),
    GetPage<dynamic>(
      name: '/wishlist',
      page: () => WishlistScreen(),
      bindings: [UserBinding(), WishlistBinding(), ProductBinding()],
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:fortuna_libya_customer/navigator/routes_const.dart';
import 'package:fortuna_libya_customer/services/auth_provider.dart';
import 'package:fortuna_libya_customer/ui/screens/auth_screens/forget_password.dart';
import 'package:fortuna_libya_customer/ui/screens/auth_screens/langauge_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/auth_screens/login_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/auth_screens/new_password_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/auth_screens/on_bording_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/auth_screens/otp_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/auth_screens/sing_up_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/auth_screens/splash_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/cart/cart_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/favourite/favourite_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/limit_offer/limited_offer.dart';
import 'package:fortuna_libya_customer/ui/screens/order/order_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/point/point_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/product/product_details.dart';
import 'package:fortuna_libya_customer/ui/screens/profile/profile_screen.dart';

import 'package:provider/provider.dart';

import '../ui/screens/auth_screens/sign_up2_screen.dart';
import '../ui/screens/home_screens/home_screen.dart';
import '../ui/screens/support/support_screen.dart';

class RouterX {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavegatorConstant.splash:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child:   SplashScreen(),
          ),
        );
        case NavegatorConstant.language:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child:   const LangaugeScreen(),
          ),
        );
      case NavegatorConstant.login:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: LoginScreen(),
          ),
        );
        case NavegatorConstant.signUp:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: SignUpScreen(),
          ),
        );
        case NavegatorConstant.signUp2:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: SignUpScreen2(),
          ),
        );
      case NavegatorConstant.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case NavegatorConstant.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: ForgetPassword(),
          ),
        );
      case NavegatorConstant.homeApp:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: HomeScreen(),
          ),
        );

      case NavegatorConstant.cart:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: const CartScreen(),
          ),
        );

      case NavegatorConstant.point:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: const PointScreen(),
          ),
        );
      case NavegatorConstant.favourite:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: FavouriteScreen(),
          ),
        );
      case NavegatorConstant.order:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: OrderScreen(),
          ),
        );
      case NavegatorConstant.productDetails:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: const ProductDetails(),
          ),
        );
      case NavegatorConstant.limitedOffer:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: LimitedOffer(),
          ),
        );
      case NavegatorConstant.profile:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: const ProfileScreen(),
          ),
        );
        case NavegatorConstant.support:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: const SupportScreen(),
          ),
        );


      // // case NavegatorConstant.searchHearing:
      // //   return MaterialPageRoute(
      // //     builder: (context) =>   SearchBarSessions(allItemsHearings: getIt<HearingProvider>().allItemsHearings),
      // //   );
      case NavegatorConstant.otp:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: OTPScreen(),
          ),
        );
      case NavegatorConstant.createNewPassword:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: NewPassword(),
          ),
        );

      // case NavegatorConstant.naveBarApp:
      //   return MaterialPageRoute(
      //     builder: (context) => MultiProvider(providers: [
      //       ChangeNotifierProvider.value(
      //         value: getIt<APIProvider>(),
      //         child: HomeScreen(),
      //       ),
      //       ChangeNotifierProvider.value(
      //         value: getIt<HearingProvider>(),
      //         child: ShowSessions(),
      //       ),
      //       ChangeNotifierProvider.value(
      //         value: getIt<TaskProvider>(),
      //         child: ShowTasks(),
      //       ),
      //       ChangeNotifierProvider.value(
      //         value: getIt<AppProvider>(),
      //         child: CalendarApp(),
      //       ),
      //     ], child: MainNavBar()),
      //   );
      // case NavegatorConstant.homeApp:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: getIt<APIProvider>(),
      //       child: HomeScreen(),
      //     ),
      //   );
      // case NavegatorConstant.showHearing:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: getIt<HearingProvider>(),
      //       child: ShowSessions(),
      //     ),
      //   );
      // case NavegatorConstant.addHearing:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: getIt<HearingProvider>(),
      //       child: AddSessions(),
      //     ),
      //   );
      // case NavegatorConstant.showTask:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: getIt<TaskProvider>(),
      //       child: ShowTasks(),
      //     ),
      //   );
      // case NavegatorConstant.addTask:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: getIt<TaskProvider>(),
      //       child: AddTaskScreen(),
      //     ),
      //   );
      // case NavegatorConstant.showCases:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: getIt<APIProvider>(),
      //       child: ShowIssuesScreens(),
      //     ),
      //   );
      // case NavegatorConstant.showConsulting:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: getIt<APIProvider>(),
      //       child: ShowConsultingScreens(),
      //     ),
      //   );
      // case NavegatorConstant.showContract:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: getIt<APIProvider>(),
      //       child: ShowContractsScreens(),
      //     ),
      //   );
      // case NavegatorConstant.showInvoices:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: getIt<APIProvider>(),
      //       child: ShowInvoicesScreens(),
      //     ),
      //   );
      // case NavegatorConstant.calendarScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: getIt<APIProvider>(),
      //       child: CalendarApp(),
      //     ),
      //   );
      // case NavegatorConstant.notificationScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: getIt<APIProvider>(),
      //       child: NotificationScreen(),
      //     ),
      //   );
      //
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

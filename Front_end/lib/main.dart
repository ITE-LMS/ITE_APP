//****************** Shopping_List Application ******************//

// import 'package:flutter/material.dart';
// import 'package:public_app/Shopping_List/Screens/grocery_list.dart';
// import 'package:get/get.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of the application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Groceries',
//       theme: ThemeData.dark().copyWith(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color.fromARGB(255, 147, 229, 250),
//           brightness: Brightness.dark,
//           surface: const Color.fromARGB(255, 42, 51, 59),
//         ),
//         scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
//         textTheme: const TextTheme().copyWith(
//           bodyMedium:
//               const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           bodySmall: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//           bodyLarge: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//           titleMedium: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20 , color: Colors.grey),
//         ),
//       ),
//       home: const Grocerys(),
//     );
//   }
// }

//****************** Meal Application ******************//

// import 'package:flutter/material.dart';
// import 'package:public_app/Meal/screens/tabs_screen.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final kLightColorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 103, 60, 0),
// );

// final theme = ThemeData(
//   useMaterial3: true,
//   colorScheme: kLightColorScheme,
//   textTheme: ThemeData().textTheme.copyWith(
//       bodyMedium: TextStyle(
//         fontSize: 20,
//         color: kLightColorScheme.onBackground,
//         fontWeight: FontWeight.w100,
//         fontFamily: 'ProtestStrike',
//       ),
//       titleMedium: const TextStyle(
//         fontSize: 30,
//         fontFamily: 'RobotoCondensed',
//         fontWeight: FontWeight.bold,
//         color: Colors.redAccent,
//       ),
//       bodyLarge: const TextStyle(
//         color: Colors.white,
//         fontSize: 20,
//         fontFamily: 'RobotoCondensed',
//         fontWeight: FontWeight.bold,
//       ),
//       bodySmall: const TextStyle(fontSize: 12)),
// );

// void main() {
//   runApp(
//     const ProviderScope(
//       child: App(),
//     ),
//   );
//   return;
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: theme,
//       home: const TabsScreen(),
//     );
//   }
// }

//****************** Roll_Dice Application ******************//

//ignore_for_file: unused_import

// import 'package:flutter/material.dart';
// import 'package:public_app/Roll_Dice/Gradient_Container.dart';
// import 'package:public_app/Roll_Dice/Text_Container.dart';
// import 'package:public_app/Roll_Dice/Main_Page.dart';
// void main() {
//   runApp(const Main());
// }

//****************** Quiz Application ******************//

// import 'package:flutter/material.dart';
// import 'package:public_app/Quiz/Main_Screen/quiz.dart';

// void main() {
//   runApp(const Quiz());
// }

//****************** Expense_Tracker Application ******************//

// ignore_for_file: non_constant_identifier_names, camel_case_types

// import 'package:public_app/Expense_Tracker/widgets/Expenses_Home_Page.dart';
// import 'package:flutter/material.dart';
// //import 'package:flutter/services.dart';
//
// void main() {
//   //WidgetsFlutterBinding.ensureInitialized();
//   //SystemChrome.setPreferredOrientations([
//   //  DeviceOrientation.portraitUp,
//   //]).then((fn){
//     runApp(const Home_Page());
//  // });
//
// }
//
// var kColorScheme = ColorScheme.fromSeed(
//   seedColor: const Color.fromARGB(255, 208, 129, 241),
// );
//
// var kDarkColorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 2, 12, 203),
// );
//
// ThemeMode kPageMode = ThemeMode.system;
//
// bool kClicked = true;
//
// class Home_Page extends StatefulWidget {
//   const Home_Page({super.key});
//
//   @override
//   State<Home_Page> createState() => _Home_PageState();
// }
//
// class _Home_PageState extends State<Home_Page> {
//   void SwitchToDarkMode() {
//     setState(
//       () {
//         if (kClicked) {
//           kClicked = false;
//           kPageMode = ThemeMode.dark;
//         } else {
//           kClicked = true;
//           kPageMode = ThemeMode.light;
//         }
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       darkTheme: ThemeData.dark().copyWith(
//         colorScheme: kDarkColorScheme,
//         appBarTheme: const AppBarTheme().copyWith(
//             backgroundColor: kDarkColorScheme.primary,
//             foregroundColor: kDarkColorScheme.primaryContainer,
//             titleTextStyle: TextStyle(
//               fontSize: 26,
//               fontWeight: FontWeight.bold,
//               color: kDarkColorScheme.primaryContainer,
//             )),
//         textButtonTheme: TextButtonThemeData(
//           style: TextButton.styleFrom(
//             backgroundColor: kDarkColorScheme.primaryContainer,
//             shape: BeveledRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//         ),
//         cardTheme: const CardTheme().copyWith(
//           color: kDarkColorScheme.primaryContainer,
//           margin: const EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 8,
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: kDarkColorScheme.primaryContainer,
//           ),
//         ),
//         textTheme: ThemeData().textTheme.copyWith(
//             titleLarge: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: kDarkColorScheme.onSecondaryContainer,
//               fontSize: 16,
//             ),
//             titleMedium: TextStyle(
//               color: kDarkColorScheme.onSecondaryContainer,
//               fontWeight: FontWeight.bold,
//             )),
//       ),
//       theme: ThemeData().copyWith(
//         colorScheme: kColorScheme,
//         appBarTheme: const AppBarTheme().copyWith(
//           backgroundColor: kColorScheme.onPrimaryContainer,
//           foregroundColor: kColorScheme.primaryContainer,
//           titleTextStyle: const TextStyle(
//             fontSize: 26,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         cardTheme: const CardTheme().copyWith(
//           color: kColorScheme.secondaryContainer,
//           margin: const EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 8,
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: kColorScheme.primaryContainer,
//           ),
//         ),
//         textTheme: ThemeData().textTheme.copyWith(
//               titleLarge: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: kColorScheme.onSecondaryContainer,
//                 fontSize: 16,
//               ),
//             ),
//       ),
//       debugShowCheckedModeBanner: false,
//       themeMode: kPageMode,
//       home: Expenses(kPageMode, SwitchToDarkMode),
//     );
//   }
// }

//****************** GetX with MVC Application ******************//

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:public_app/MVC/view/Home.dart';

// void main() {
//   runApp(Home());
// }

//****************** Favorites Places Application ******************//

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pub_app/Favorite_Places/controllers/Fav_Binding.dart';
// import 'package:pub_app/Favorite_Places/middleware/auth_middleware.dart';
// import 'package:pub_app/Favorite_Places/views/Fav_Places.dart';
// import 'package:pub_app/Favorite_Places/views/Sign_Up.dart';
// import 'package:pub_app/Favorite_Places/views/add_Fav.dart';
// import 'package:pub_app/Favorite_Places/views/Sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final colorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 102, 6, 247),
//   background: const Color.fromARGB(255, 76, 0, 96),
// );

// final theme = ThemeData().copyWith(
//   scaffoldBackgroundColor: colorScheme.background,
//   colorScheme: colorScheme,
//   textTheme: ThemeData().textTheme.copyWith(
//         titleSmall: const TextStyle(
//           fontFamily: 'RobotoCondensed',
//           fontWeight: FontWeight.bold,
//         ),
//         titleMedium: const TextStyle(
//           fontFamily: 'RobotoCondensed',
//           fontWeight: FontWeight.bold,
//         ),
//         titleLarge: const TextStyle(
//           fontFamily: 'RobotoCondensed',
//           fontWeight: FontWeight.bold,
//         ),
//         // bodyMedium: const TextStyle(color: Colors.white),
//         //bodySmall: const TextStyle(color: Colors.white),
//         //bodyLarge: const TextStyle(color: Colors.white),
//       ),
// );

// SharedPreferences? sharedPref;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   sharedPref = await SharedPreferences.getInstance();

//   runApp(
//     const MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       initialRoute: '/',
//       initialBinding: FavBinding(),
//       debugShowCheckedModeBanner: false,
//       theme: theme,
//       getPages: [
//         GetPage(name: '/favoritesPlaces', page: () => const FavoritesPlaces()),
//         GetPage(name: '/addFavPlace', page: () => const AddFavoritePlace()),
//         GetPage(
//             name: '/',
//             page: () => const SignIn(),
//             middlewares: [AuthMiddleware()]),
//         GetPage(name: '/SignUp', page: () => const SignUp())
//       ],
//     );
//   }
// }

//******************  Project 1 Application ******************//

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project%201/controllers/Auth_Controllers/pass_Controller.dart';
import 'package:public_testing_app/Project%201/controllers/Auth_Controllers/verification_controller.dart';
import 'package:public_testing_app/Project%201/views/Auth_Screens/email_Screen.dart';
import 'package:public_testing_app/Project%201/views/Auth_Screens/password_Screen.dart';
import 'package:public_testing_app/Project%201/views/Auth_Screens/verfication_screen.dart';
import 'package:public_testing_app/Project%201/views/Introduction_Screens/IntroductionScreen.dart';
import 'package:public_testing_app/Project%201/views/Student_app/Student_HomePage_Screen.dart';
import 'package:public_testing_app/Themes.dart';
import 'package:public_testing_app/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Project 1/controllers/dark_mode_Controller.dart';
import 'Project 1/middlewares/is_Doctor_Middleware.dart';

SharedPreferences? Auth;
SharedPreferences? is_Dark;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Auth = await SharedPreferences.getInstance();
  is_Dark = await SharedPreferences.getInstance();
  runApp(
    GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: is_Dark!.getString('is_dark') == 'true'
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: 'IntroductionScreens',
      getPages: [
        GetPage(
          name: '/IntroductionScreens',
          page: () => const IntroductionScreens(),
          middlewares: [
            isDoctorMiddleware(),
          ],
        ),
        GetPage(name: '/EmailPageScreen', page: () => const EmailScreen()),
        GetPage(name: '/PassPageScreen', page: () => const PasswordScreen()),
        GetPage(
            name: '/VerificationPageScreen',
            page: () => const VerificationScreen()),
        GetPage(
          name: '/StudentHomePageScreen',
          page: () => const StudentHomePageScreen(),
        ),
        // GetPage(
        //   name: '/DoctorHomePageScreen',
        //   page: () => const DoctorDrawerScreen(),
        // ),
      ],
    ),
  );
}

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(DarkModeController());
  }
}

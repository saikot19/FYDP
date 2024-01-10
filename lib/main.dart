import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import './view/profile_view_screen.dart';
import './view/add_vehicle.dart';
import './view/edit_profile_page.dart';
import './view/edit_vehicle.dart';
import './view/friend_list_page.dart';
import './view/navigator.dart';
import './view/login_page_screen.dart';
import './view/registration_page_screen.dart';
import './view/splash_screen.dart';
import 'controller/services/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Janbahon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: const TextStyle(
                fontSize: 20,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.normal,
              ),
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w500,
              ),
              titleLarge: const TextStyle(
                fontSize: 24,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (ctx) => const SplashScreen(),
        RegistrationPageScreen.routeName: (ctx) =>
            const RegistrationPageScreen(),
        LoginPageScreen.routeName: (ctx) => LoginPageScreen(),
        MainNavigator.routeName: (ctx) => const MainNavigator(),
        EditProfilePage.routeName: (ctx) => const EditProfilePage(),
        ProfileViewScreen.routeName: (ctx) => const ProfileViewScreen(),
        FriendListScreen.routeName: (ctx) => const FriendListScreen(),
        EditVehicleScreen.routeName: (ctx) => const EditVehicleScreen(),
        AddVehicleScreen.routeName: (ctx) => const AddVehicleScreen(),
      },
    );
  }
}

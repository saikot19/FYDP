import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:janbahon_v2/controller/utils/constant.dart';
import 'package:provider/provider.dart';
import '../controller/services/user_provider.dart';
import './add_vehicle.dart';
import './edit_vehicle.dart';
import './friend_list_page.dart';

import './widgets/profile_add_car_Service.dart';
import './widgets/profile_car_card_widget.dart';
import './widgets/profile_friend_card_widget.dart';
import 'edit_profile_page.dart';
import 'login_page_screen.dart';

// ignore: camel_case_types
class profilePageScreen extends StatefulWidget {
  const profilePageScreen({super.key});

  @override
  State<profilePageScreen> createState() => _profilePageScreenState();
}

// ignore: camel_case_types
class _profilePageScreenState extends State<profilePageScreen> {
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
  bool callOnce = false;
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    if (!callOnce) {
      userProvider = Provider.of<UserProvider>(context);
      callOnce = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        key: scaffolKey,
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        scaffolKey.currentState?.openEndDrawer();
                      },
                      icon: Icon(Icons.menu_rounded),
                    ),
                  ),
                ],
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(800),
                  child: userProvider.currentUser!.image != null
                      ? Image.memory(
                          base64.decode(userProvider.currentUser!.image),
                          width: mediaQuery.size.width * .38,
                          height: mediaQuery.size.width * .38,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/Man.jpg',
                          width: mediaQuery.size.width * .38,
                          height: mediaQuery.size.width * .38,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                userProvider.currentUser!.username,
                style: Theme.of(context).textTheme.titleLarge?.apply(
                      fontSizeFactor: .9,
                    ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                userProvider.currentUser!.email,
                style: Theme.of(context).textTheme.titleMedium?.apply(
                      fontSizeFactor: .7,
                      color: Colors.grey.shade700,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 10,
                    color: Colors.grey.shade300,
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Friends',
                      style: Theme.of(context).textTheme.titleLarge?.apply(
                            fontSizeFactor: .8,
                            color: Colors.grey.shade800,
                          ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          FriendListScreen.routeName,
                        );
                      },
                      icon: const Icon(
                        Icons.list,
                        color: Colors.blue,
                      ),
                      label: Text(
                        'See in list',
                        style: Theme.of(context).textTheme.titleMedium?.apply(
                              fontSizeFactor: .8,
                              color: Colors.blue,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: mediaQuery.size.height * .18,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    children: [
                      friendCard(),
                      friendCard(),
                      friendCard(),
                      friendCard(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 10,
                    color: Colors.grey.shade300,
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Car at service',
                      style: Theme.of(context).textTheme.titleLarge?.apply(
                            fontSizeFactor: .8,
                            color: Colors.grey.shade800,
                          ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          EditVehicleScreen.routeName,
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      label: Text(
                        'Edit',
                        style: Theme.of(context).textTheme.titleMedium?.apply(
                              fontSizeFactor: .8,
                              color: Colors.blue,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: mediaQuery.size.width * 1.5,
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    children: [
                      ProfileCarCard(),
                      ProfileCarCard(),
                      ProfileCarCard(),
                      ProfileCarCard(),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AddVehicleScreen.routeName,
                            );
                          },
                          child: addCarCard()),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 10,
                    color: Colors.grey.shade400,
                  )),
                ],
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          width: mediaWidth * .8,
          child: Container(
            color: Colors.grey.shade200,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(800),
                        child: userProvider.currentUser!.image != null
                            ? Image.memory(
                                base64.decode(userProvider.currentUser!.image),
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/Man.jpg',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        userProvider.currentUser!.username,
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                              fontSizeFactor: .8,
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        userProvider.currentUser!.email,
                        style: Theme.of(context).textTheme.titleMedium?.apply(
                              fontSizeFactor: .7,
                              color: Colors.grey.shade500,
                            ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            EditProfilePage.routeName,
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Edit Profile',
                          style: Theme.of(context).textTheme.titleLarge?.apply(
                                fontSizeFactor: .8,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            FriendListScreen.routeName,
                          );
                        },
                        icon: const Icon(
                          Icons.people_alt,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Friends',
                          style: Theme.of(context).textTheme.titleLarge?.apply(
                                fontSizeFactor: .8,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            EditVehicleScreen.routeName,
                          );
                        },
                        icon: Image.asset(
                          "assets/images/carSettings.png",
                          height: 25,
                        ),
                        label: Text(
                          'Edit Services',
                          style: Theme.of(context).textTheme.titleLarge?.apply(
                                fontSizeFactor: .8,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/aboutUs.png",
                          height: 25,
                        ),
                        label: Text(
                          'About Us',
                          style: Theme.of(context).textTheme.titleLarge?.apply(
                                fontSizeFactor: .8,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          userProvider.currentUser = null;
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            LoginPageScreen.routeName,
                            (Route<dynamic> route) => false,
                          );
                        },
                        icon: Icon(
                          Icons.logout,
                          color: Colors.red.shade600,
                        ),
                        label: Text(
                          'LogOut',
                          style: Theme.of(context).textTheme.titleLarge?.apply(
                                fontSizeFactor: .8,
                                color: Colors.red.shade600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

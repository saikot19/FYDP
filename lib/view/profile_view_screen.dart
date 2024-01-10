import 'package:flutter/material.dart';
import './widgets/profile_view_car_card.dart';

// ignore: camel_case_types
class ProfileViewScreen extends StatefulWidget {
  static const routeName = '/profileViewPage';
  const ProfileViewScreen({super.key});

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

// ignore: camel_case_types
class _ProfileViewScreenState extends State<ProfileViewScreen> {
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        key: scaffolKey,
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(800),
                  child: Image.asset(
                    'assets/images/Me.jpg',
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
                'Tahmim Jawad',
                style: Theme.of(context).textTheme.titleLarge?.apply(
                      fontSizeFactor: .9,
                    ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'tahamimjawad@gmail.com',
                style: Theme.of(context).textTheme.titleMedium?.apply(
                      fontSizeFactor: .7,
                      color: Colors.grey.shade700,
                    ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.grey.shade200,
                    ),
                    child: Text(
                      'Confirm',
                      style: Theme.of(context).textTheme.titleLarge?.apply(
                            color: Colors.grey.shade200,
                            fontSizeFactor: .7,
                          ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                      backgroundColor: Colors.red.shade700,
                      foregroundColor: Colors.grey.shade200,
                    ),
                    child: Text(
                      'Delete',
                      style: Theme.of(context).textTheme.titleLarge?.apply(
                            color: Colors.grey.shade200,
                            fontSizeFactor: .7,
                          ),
                    ),
                  ),
                ],
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
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: mediaQuery.size.height * .5,
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    children: const [
                      ProfileViewCarCard(),
                      ProfileViewCarCard(),
                      ProfileViewCarCard(),
                      ProfileViewCarCard(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

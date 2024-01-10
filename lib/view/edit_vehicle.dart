import 'package:flutter/material.dart';
import './widgets/edit_car_card.dart';
import './widgets/profile_car_card_widget.dart';

import 'add_vehicle.dart';

// ignore: camel_case_types
class EditVehicleScreen extends StatelessWidget {
  static const routeName = '/editVehicleScreen';
  const EditVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Edit Service',
          style: Theme.of(context).textTheme.titleLarge?.apply(
                color: Colors.black,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _mediaQuery.size.height * .82,
              child: GridView.count(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                children: const [
                  editCarCard(),
                  editCarCard(),
                  editCarCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, top: 4),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AddVehicleScreen.routeName,
            );
          },
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
    );
  }
}

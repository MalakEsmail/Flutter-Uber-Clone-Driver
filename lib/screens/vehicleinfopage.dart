import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/brand_colors.dart';
import 'package:driver/global_variables.dart';
import 'package:driver/screens/main_page.dart';
import 'package:driver/widgets/TaxiOutlineButton.dart';
import 'package:flutter/material.dart';

class VehicleInfoPage extends StatefulWidget {
  const VehicleInfoPage({Key? key}) : super(key: key);

  @override
  State<VehicleInfoPage> createState() => _VehicleInfoPageState();
}

class _VehicleInfoPageState extends State<VehicleInfoPage> {
  final carModelController = TextEditingController();
  final carColorController = TextEditingController();
  final carNumberController = TextEditingController();
  updateProfile() async {
    String uId = currentUser!.uid;
    Map<String, dynamic> map = {
      "car_color": carColorController.text,
      "car_model": carModelController.text,
      "car_number": carNumberController.text,
    };
    await FirebaseFirestore.instance
        .collection("drivers")
        .doc(uId)
        .collection("vehicle_details")
        .doc()
        .set(map);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "images/logo.png",
              height: 110,
              width: 110,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("Enter Vehicle Details"),
                  TextField(
                    controller: carModelController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Car Model",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: carColorController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Car Color",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: carNumberController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "vehicle Number",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TaxiOutlineButton(
                      title: "Proceed",
                      onPressed: () {
                        updateProfile();
                      },
                      color: BrandColors.colorGreen),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

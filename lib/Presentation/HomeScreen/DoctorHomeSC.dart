import 'package:adixion/Core/Bloc/Home_bloc.dart';
import 'package:adixion/Core/Controller.dart/themecontroller.dart';
import 'package:adixion/Presentation/Patient/Patientlist.dart';
import 'package:adixion/Presentation/Patient/add_patient_screen.dart';
import 'package:adixion/Presentation/Prescription/prescription_from_doctor_side.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

import 'package:get/get.dart';

class Doctorhomesc extends StatefulWidget {
  const Doctorhomesc({super.key});

  @override
  State<Doctorhomesc> createState() => _DoctorhomescState();
}

class _DoctorhomescState extends State<Doctorhomesc> {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadHome()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Stack(
                children: [
                  /// Background Image
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/background/05_Home screen.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Main Content
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: state.isLoading ? 0 : 1,
                    child: Column(
                      children: [
                        header(),
                        Expanded(child: content()),
                        // SizedBox(height: 80), 
                      ],
                    ),
                  ),

                  /// Bottom Bar ON TOP of background
                  // Positioned(
                  //   bottom: 0,
                  //   left: 0,
                  //   right: 0,
                  //   child: bottomBar(),
                  // ),

                  /// Loading
                  if (state.isLoading)
                    Center(child: CircularProgressIndicator()),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: bottomBar(),
      ),
    );
  }

  /// Header
  Widget header() {
    return Container(
      // color: Colors.transparent,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff6A5AE0), Color(0xff8E2DE2)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          // Row(
          //   children: [
          //     Image.asset("assets/logo/logo.png", height: 35),
          //     Spacer(),
          //     Obx(() => Switch(
          //           value: themeController.isDark.value,
          //           onChanged: (v) => themeController.toggleTheme(),
          //         )),
          //   ],
          // ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Doctor",
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "Rubik",
                      ),
                    ),
                    Text(
                      "Subhash Sharma",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage("assets/Icons/Home/image.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  "assets/Icons/Home/Menu.png",
                  width: 44,
                  height: 44,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Content
  Widget content() {
    return SingleChildScrollView(
      // padding: EdgeInsets.all(15),
      child: Column(
        children: [
          FadeInUp(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: Image.asset("assets/Icons/Home/slider.jpeg"),
            ),
          ),

          SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FadeInUp(
              delay: Duration(milliseconds: 200),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Center(
                  child: Text(
                    "Upgrade to Premium",
                    style: TextStyle(color: Colors.blue, fontFamily: "Rubik"),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: gridMenu(),
          ),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: recordSection(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  /// Grid Menu
  Widget gridMenu() {
    final items = [
      "Patient List",
      // "Adixon patient app",
      "Appointments",
      "My Templates",
      "Send Notifications",
      "View Records",
    ];
    final itemsimage = [
      "assets/Icons/Home/service/patient.png",
      "assets/Icons/Home/service/appointment.png",
      "assets/Icons/Home/service/template.png",
      "assets/Icons/Home/service/notification.png",
      "assets/Icons/Home/service/report.png",
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.80,
      ),
      itemBuilder: (context, index) {
        return FadeInUp(
          delay: Duration(milliseconds: 100 * index),
          child: GestureDetector(
            onTap: () {
              if (items[index] == "Patient List") {
                Get.to(PatientListScreen());
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CircleAvatar(radius: 18, backgroundColor: Colors.orange),
                  Image.asset(
                    itemsimage[index],
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5),
                  Text(
                    items[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "Rubik", fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Record Section
  Widget recordSection() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Record",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Rubik",
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "See all",
              style: TextStyle(color: Colors.blue, fontFamily: "Rubik"),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: recordCard(
                "assets/Icons/Home/Records/temp.png",
                "My Template",
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(AddPatientScreen());
                },
                child: recordCard(
                  "assets/Icons/Home/Records/patient.png",
                  "Add Patient",
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(PrescriptionFromDoctorSide());
                },
                child: recordCard(
                  "assets/Icons/Home/Records/prescription.png",
                  "Prescription",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget recordCard(String items, String itemname) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(items, width: 70, height: 70, fit: BoxFit.fill),
        ),
        Text(itemname),
      ],
    );
  }

  /// Bottom Navigation Bar
  Widget bottomBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.home, color: Colors.white),
          ),
          Icon(Icons.favorite_border),
          Icon(Icons.menu_book),
          Icon(Icons.chat_bubble_outline),
        ],
      ),
    );
  }
}

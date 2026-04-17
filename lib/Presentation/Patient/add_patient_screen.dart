import 'package:adixion/Core/helper/image_assets.dart';
import 'package:adixion/Presentation/Patient/add_patient_screen_vitls.dart';
import 'package:adixion/Core/widgets/custom_button.dart';
import 'package:adixion/Presentation/Patient/widgets/custom_gender_selection.dart';
import 'package:adixion/Presentation/Patient/widgets/custom_header_widgets.dart';
import 'package:adixion/Core/widgets/custom_section_title.dart';
import 'package:adixion/Presentation/Patient/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  final _formKey = GlobalKey<FormState>();

  String selectedGender = "Male";

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF2F5),

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.backgroundImagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const CustomHeaderWidgets(currentStep: 1),

              Expanded(child: Stack(children: [_buildForm()])),
            ],
          ),
        ),
      ),
    );
  }

  //  FORM
  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSectionTitle(
              icon: ImageAssets.personInformation,
              title: 'Personal Information',
              widthIcon: 14.14,
              heightIcon: 18,
            ),
            const SizedBox(height: 25),

            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    label: "First Name",
                    hint: "Rishabh",
                    icon: ImageAssets.name,
                    widthIcon: 16,
                    heightIcon: 16,
                    textColor: Color(0xFF888A8E),
                    controller: _firstNameController,
                    validator: (v) =>
                        v!.isEmpty ? "Please enter first name" : null,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CustomFormField(
                    label: "Last Name",
                    hint: "Singh",
                    textColor: Color(0xFF888A8E),
                    controller: _lastNameController,
                    validator: (v) =>
                        v!.isEmpty ? "Please enter last name" : null,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            CustomFormField(
              label: "Phone Number",
              hint: "+91 98765 43210",
              icon: ImageAssets.phone,
              heightIcon: 16,
              widthIcon: 16,
              textColor: Color(0xFF888A8E),
              keyboardType: TextInputType.phone,
              controller: _phoneController,
              validator: (v) => v!.length < 10 ? "Invalid phone number" : null,
            ),

            const SizedBox(height: 20),

            CustomFormField(
              label: "Email Address",
              hint: "patient@email.com",
              icon: ImageAssets.email,
              heightIcon: 14.21,
              widthIcon: 16,
              textColor: Color(0xFF888A8E),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              validator: (v) => v!.isEmpty ? "Please enter email" : null,
            ),

            const SizedBox(height: 20),

            CustomFormField(
              label: "Date of Birth",
              hint: "mm/dd/yyyy",
              icon: ImageAssets.date,
              keyboardType: TextInputType.datetime,
              widthIcon: 14,
              heightIcon: 17.11,
              suffixIcon: Icons.calendar_month,
              textColor: Colors.black,
              controller: _dobController,
              validator: (v) => v!.isEmpty ? "Please enter DOB" : null,
            ),

            const SizedBox(height: 20),

            const Text(
              "GENDER",
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            CustomGenderSelection(
              initialValue: selectedGender,
              onGenderChanged: (val) {
                setState(() {
                  selectedGender = val;
                });
              },
            ),

            const SizedBox(height: 40),

            CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MedicalInfoScreen()),
                  );
                }
              },
              text: 'Continue',
              icon: ImageAssets.arrowForward,
              buttonColor: Color(0xFF8D34B0),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

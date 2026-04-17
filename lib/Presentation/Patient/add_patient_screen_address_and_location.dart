import 'package:adixion/Core/helper/image_assets.dart';
import 'package:adixion/Core/widgets/custom_button.dart';
import 'package:adixion/Presentation/Patient/widgets/custom_header_widgets.dart';
import 'package:adixion/Core/widgets/custom_section_title.dart';
import 'package:adixion/Presentation/Patient/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddPatientScreenAddressAndLocation extends StatelessWidget {
  const AddPatientScreenAddressAndLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.backgroundImagePath2),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const CustomHeaderWidgets(currentStep: 3),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),

                        const CustomSectionTitle(
                          icon: ImageAssets.adderssAndLocation,
                          title: 'Address & Location',
                          widthIcon: 18,
                          heightIcon: 18,
                        ),

                        const SizedBox(height: 20),

                        CustomFormField(
                          label: 'Street address',
                          hint: 'House No., Street, Area...',
                          keyboardType: TextInputType.multiline,
                        ),

                        const SizedBox(height: 20),

                        CustomFormField(
                          label: 'City / District',
                          hint: 'Jaipur',
                          icon: ImageAssets.city,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),

                        const SizedBox(height: 80),

                        CustomButton(
                          onPressed: () {},
                          text: 'Add Patient',
                          icon: ImageAssets.check,
                          buttonColor: Color(0xFF8D34B0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

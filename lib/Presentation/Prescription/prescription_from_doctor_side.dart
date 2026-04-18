import 'package:adixion/Core/helper/image_assets.dart';
import 'package:adixion/Core/theme/color_app.dart';
import 'package:adixion/Presentation/Prescription/prescription_from_doctor_side2.dart';
import 'package:adixion/Presentation/Prescription/widgets/button_prescription.dart';
import 'package:adixion/Presentation/Prescription/widgets/custom_header.dart';
import 'package:adixion/Presentation/Prescription/widgets/custom_text_form_field.dart';
import 'package:adixion/Presentation/Prescription/widgets/patient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PrescriptionFromDoctorSide extends StatelessWidget {
  const PrescriptionFromDoctorSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.scaffoldColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.backgroundImagePath2),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeader(currentStep: 1),

              const SizedBox(height: 16),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PATIENT',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF808080),
                            letterSpacing: 1,
                          ),
                        ),

                        const SizedBox(height: 12),
                        const PatientWidgets(),

                        const SizedBox(height: 12),
                        const CustomTextFormField(
                          label: 'DIAGNOSIS By Staff',
                          hint: 'Viral Fever & Throat Infection',
                          fieldFillColor: Color(0xFFF9FCFF),

                          icon: ImageAssets.stethoscope,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),

                        const SizedBox(height: 12),
                        const CustomTextFormField(
                          label: 'DIAGNOSIS',
                          hint: 'Cough',
                          fieldFillColor: Color(0xFFF9FCFF),

                          icon: ImageAssets.stethoscope,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),

                        const SizedBox(height: 12),
                        const CustomTextFormField(
                          label: 'Finding',
                          hint: 'Cough',
                          fieldFillColor: Color(0xFFF9FCFF),
                          icon: ImageAssets.stethoscope,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                label: 'Height (cm)',
                                hint: '170',
                                fieldFillColor: Color(0xFFFFFFFF),
                                icon: ImageAssets.heightPrescription,
                                keyboardType: TextInputType.number,
                                widthIcon: 16,
                                heightIcon: 16,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextFormField(
                                fieldFillColor: Color(0xFFFFFFFF),
                                icon: ImageAssets.weight,
                                label: 'Weight (kg)',
                                hint: '70',
                                widthIcon: 16,
                                heightIcon: 16,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                label: 'Bp',
                                hint: '170',
                                fieldFillColor: Color(0xFFFFFFFF),
                                icon: ImageAssets.heightPrescription,
                                widthIcon: 16,
                                heightIcon: 16,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextFormField(
                                fieldFillColor: Color(0xFFFFFFFF),
                                icon: ImageAssets.weight,
                                label: 'Hemoglobin (Kg)',
                                hint: '70',
                                widthIcon: 16,
                                heightIcon: 16,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const CustomTextFormField(
                          label: 'DIAGNOSIS',
                          hint: 'Cough',
                          fieldFillColor: Color(0xFFF9FCFF),

                          icon: ImageAssets.stethoscope,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),

                        const SizedBox(height: 12),
                        const CustomTextFormField(
                          label: 'Finding',
                          hint: 'Cough',
                          fieldFillColor: Color(0xFFF9FCFF),
                          icon: ImageAssets.stethoscope,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),
                        const SizedBox(height: 12),

                        const CustomTextFormField(
                          label: 'Treatment or Advice',
                          hint:
                              'Add instructions, follow-up advice, restrictions...',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF787878),
                          ),

                          fieldFillColor: Color(0xFFF9FCFF),
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: 12),

                        const CustomTextFormField(
                          label: 'Chest Complaint',
                          hint:
                              'Add instructions, follow-up advice, restrictions...',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF787878),
                          ),

                          fieldFillColor: Color(0xFFF9FCFF),
                          keyboardType: TextInputType.multiline,
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                label: 'Spo2',
                                hint: '170',
                                fieldFillColor: Color(0xFFFFFFFF),
                                icon: ImageAssets.heightPrescription,
                                widthIcon: 16,
                                heightIcon: 16,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextFormField(
                                fieldFillColor: Color(0xFFFFFFFF),
                                icon: ImageAssets.weight,
                                label: 'Respriotry',
                                hint: '70',
                                widthIcon: 16,
                                heightIcon: 16,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),

                        const CustomTextFormField(
                          label: 'DOCTOR’S NOTES',
                          hint:
                              'Add instructions, follow-up advice, restrictions...',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF787878),
                          ),

                          fieldFillColor: Color(0xFFF9FCFF),
                          keyboardType: TextInputType.multiline,
                        ),

                        const SizedBox(height: 12),
                        const CustomTextFormField(
                          label: 'FOLLOW-UP DATE',
                          hint: 'mm/dd/yyyy',
                          keyboardType: TextInputType.number,
                          fieldFillColor: Color(0xFFF9FCFF),
                          icon: ImageAssets.calender,
                          suffixIcon: ImageAssets.data,
                          widthIcon: 12,
                          heightIcon: 12,
                        ),
                        SizedBox(height: 15),

                        ButtonPrescription(
                          onPressed: () {
                            Get.to(const PrescriptionFromDoctorSide2());
                          },
                        ),

                        SizedBox(height: 50),
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

import 'package:adixion/Core/helper/image_assets.dart';
import 'package:adixion/Core/theme/color_app.dart';
import 'package:adixion/Core/widgets/custom_button.dart';
import 'package:adixion/Core/widgets/custom_section_title.dart';
import 'package:adixion/Presentation/Prescription/data/data_source/medicine_database.dart';
import 'package:adixion/Presentation/Prescription/data/models/medicine_model.dart';
import 'package:adixion/Presentation/Prescription/prescription_from_doctor_side_lab.dart';
import 'package:adixion/Presentation/Prescription/widgets/border_container.dart';
import 'package:adixion/Presentation/Prescription/widgets/button_prescription.dart';
import 'package:adixion/Presentation/Prescription/widgets/custom_header.dart';
import 'package:adixion/Presentation/Prescription/widgets/custom_text_form_field.dart';
import 'package:adixion/Presentation/Prescription/widgets/empty_state.dart';
import 'package:adixion/Presentation/Prescription/widgets/patient_widgets.dart';
import 'package:adixion/Presentation/Prescription/widgets/show_add_medicine_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PrescriptionFromDoctorSide2 extends StatefulWidget {
  const PrescriptionFromDoctorSide2({super.key});

  @override
  State<PrescriptionFromDoctorSide2> createState() =>
      _PrescriptionFromDoctorSide2State();
}

class _PrescriptionFromDoctorSide2State
    extends State<PrescriptionFromDoctorSide2> {
  void _refreshData() {
    setState(() {});
  }

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
              const CustomHeader(currentStep: 2),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
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
                      const SizedBox(height: 8),
                      const PatientWidgets(),
                      const SizedBox(height: 16),

                      const CustomTextFormField(
                        label: 'DIAGNOSIS',
                        hint: 'Viral Fever & Throat Infection',
                        fieldFillColor: Color(0xFFF9FCFF),
                        icon: ImageAssets.stethoscope,
                        widthIcon: 18,
                        heightIcon: 18,
                      ),
                      const SizedBox(height: 16),

                      const CustomSectionTitle(
                        icon: ImageAssets.drugs,
                        title: 'MEDICINES',
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorApp.labelColor,
                        ),
                        widthIcon: 20,
                        heightIcon: 20,
                      ),
                      const SizedBox(height: 12),

                      FutureBuilder<List<MedicineModel>>(
                        future: MedicineDatabase.instance.getAllMedicines(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final medicines = snapshot.data ?? [];
                          if (medicines.isEmpty) {
                            return EmptyState(
                              icon: ImageAssets.drugs,
                              subtitle: 'Tap below to add medicines',
                              title: 'No medicines add yet',
                            );
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: medicines.length,
                            itemBuilder: (context, index) {
                              final med = medicines[index];
                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FCFF),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      ImageAssets.baneg,
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  med.medicineName,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF333333),
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  await MedicineDatabase
                                                      .instance
                                                      .deleteMedicine(med.id!);
                                                  _refreshData();
                                                },
                                                child: const Icon(
                                                  Icons.delete_outline,
                                                  color: Color(0xFFE57373),
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),

                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    const TextSpan(
                                                      text: "Dosage: ",
                                                      style: TextStyle(
                                                        color: Colors.purple,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: "${med.qty} tablet",
                                                      style: const TextStyle(
                                                        color: Color(
                                                          0xFF64748B,
                                                        ),
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              // Frequency
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.access_time,
                                                    size: 14,
                                                    color: Color(0xFF4DB6AC),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    med.frequency,
                                                    style: const TextStyle(
                                                      color: Color(0xFF64748B),
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),

                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .calendar_today_outlined,
                                                    size: 14,
                                                    color: Color(0xFF4DB6AC),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    "${med.noOfDays} days",
                                                    style: const TextStyle(
                                                      color: Color(0xFF64748B),
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 25),
                                              // Instruction
                                              Expanded(
                                                child: Text(
                                                  med.instruction,
                                                  style: const TextStyle(
                                                    color: Color(0xFF64748B),
                                                    fontSize: 13,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 15),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10,
                        ),
                        child: DashedBorderContainer(
                          child: CustomButton(
                            height: 50,
                            width: 335,
                            onPressed: () async {
                              await showAddMedicineSheet(context);
                              _refreshData();
                            },
                            text: 'Add Medicine',
                            textStyle: TextStyle(color: ColorApp.textColor),
                            icon: ImageAssets.add,
                            buttonColor: const Color(0xFFF9FCFF),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),
                      const CustomTextFormField(
                        label: 'DOCTOR\'S NOTES',
                        hint:
                            'Add instructions, follow-up advice, restrictions...',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF787878),
                        ),
                        fieldFillColor: Color(0xFFF9FCFF),
                        keyboardType: TextInputType.multiline,
                      ),
                      const SizedBox(height: 16),
                      const CustomTextFormField(
                        label: 'FOLLOW-UP DATE',
                        hint: 'mm/dd/yyyy',
                        fieldFillColor: Color(0xFFF9FCFF),
                        icon: ImageAssets.calender,
                        suffixIcon: ImageAssets.data,
                        widthIcon: 16,
                        heightIcon: 16,
                      ),
                      const SizedBox(height: 25),
                      ButtonPrescription(
                        onPressed: () {
                          Get.to(const PrescriptionFromDoctorSideLab());
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
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

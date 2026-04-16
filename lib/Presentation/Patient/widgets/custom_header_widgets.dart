import 'package:flutter/material.dart';

class CustomHeaderWidgets extends StatelessWidget {
  final int currentStep;
  const CustomHeaderWidgets({super.key, required this.currentStep});

  static const _activeLabel = Color(0xFFF3F7FA);
  static const _inactiveLabel = Color(0xFFBDCBCE);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/Patient/header.png',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/Icons/Patient/Frame.png',
                      width: 35,
                      height: 35.61,
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add New Patient',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Fill in patient details',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFD0DCF4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset(
                      'assets/Icons/Patient/Add.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Step $currentStep to 3",
                            style: const TextStyle(
                              color: Color(0xFFD0DCF4),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              _stepLine(currentStep >= 1),
                              _stepLine(currentStep >= 2),
                              _stepLine(currentStep >= 3),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _stepLabel("Personal", currentStep == 1),
                              _stepLabel("Medical", currentStep == 2),
                              _stepLabel("Address", currentStep == 3),
                            ],
                          ),
                        ],
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
  }

  Widget _stepLine(bool active) => Expanded(
        child: Container(
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: active ? const Color(0xFFF3F7FA) : const Color(0xFF86B6C0),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      );

  Widget _stepLabel(String text, bool isActive) => Text(
        text,
        style: TextStyle(
          color: isActive ? _activeLabel : _inactiveLabel,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      );
}
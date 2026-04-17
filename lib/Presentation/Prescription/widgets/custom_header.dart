import 'package:adixion/Core/helper/image_assets.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final int currentStep;
  const CustomHeader({super.key, required this.currentStep});

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
          Image.asset(ImageAssets.headerPrescription, fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageAssets.backBottom,
                                width: 35,
                                height: 35.61,
                              ),

                              const SizedBox(width: 12),
                              const Text(
                                'Write Prescription',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            ImageAssets.calender,
                            width: 12,
                            height: 12,
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            '12 Mar 2026',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset(ImageAssets.addBottom, width: 40, height: 40),
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
                              _stepLabel("Case History", currentStep == 1),
                              _stepLabel("Medical", currentStep == 2),
                              _stepLabel("Lab Test", currentStep == 3),
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

import 'package:adixion/Core/helper/image_assets.dart';
import 'package:adixion/Core/theme/color_app.dart';
import 'package:adixion/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ButtonPrescription extends StatelessWidget {
  final VoidCallback? onPressed;
  const ButtonPrescription({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          height: 60,
          width: 150,
          onPressed: onPressed,
          text: 'Save Draft',
          textStyle: TextStyle(fontSize: 12, color: ColorApp.textColor),
          icon: ImageAssets.drft,
          buttonColor: Color(0xFFFFFFFF),
          border: Border.all(color: ColorApp.textColor),
          
        ),
        CustomButton(
          height: 60,
          width: 150,
          onPressed: onPressed,
          text: 'Next',
          icon: ImageAssets.send,
          widthicon: 20,
          heighticon: 20,

          buttonColor: Color(0xFF8D34B0),
        ),
      ],
    );
  }
}

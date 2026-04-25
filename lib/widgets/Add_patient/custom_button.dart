import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String? subText; // 👈 NEW STRING
  final IconData? icon;
  final double? widthicon;
  final double? heighticon;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Border? border;
    final String? assetIcon;      // 👈 NEW for image asset


   CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.subText,
        this.assetIcon, // 👈 add this

    this.icon,
    this.buttonColor,
    this.widthicon,
    this.heighticon,
    this.height,
    this.width,
    this.border, 
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width ?? 400,
          height: height ?? 60,
          decoration: BoxDecoration(
            color: const Color(0xFF8D34B0),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: const Color(0xFF8B5CF6).withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (subText != null)
               Image.asset(
                subText!,
                width: widthicon ?? 16,
                height: heighticon ?? 15.83,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFFEDEDED),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              if (icon != null)
              Icon(icon, color: Colors.white, size: 25),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String hint;
  final String? icon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Color? textColor;
  final Color? iconColor;
  final double? widthIcon;
  final double? heightIcon;

  const CustomFormField({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textColor,
    this.iconColor,
    this.widthIcon,
    this.heightIcon,
  });

  static const Color fieldFillColor = Color(0xFFF8FEFB);
  static const Color primaryGreen = Color(0xFF0F6E56);
  static const Color borderSideColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          cursorColor: primaryGreen,
          maxLines: keyboardType == TextInputType.multiline ? 3 : 1,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: textColor, fontSize: 14),
            prefixIcon: icon != null
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      icon!,
                      width: widthIcon,
                      height: heightIcon,
                      fit: BoxFit.contain,
                    ),
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, size: 20, color: iconColor ?? Colors.black87)
                : null,
            filled: true,
            fillColor: fieldFillColor,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderSideColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryGreen, width: 1.2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}

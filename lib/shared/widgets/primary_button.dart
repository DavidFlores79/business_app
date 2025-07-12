import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool expand;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  final IconData? icon;
  final Widget? image;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.expand = false,
    this.isLoading = false,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.gray800,
    this.borderColor = AppColors.gray800,
    this.icon,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final buttonContent =
        isLoading
            ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) Icon(icon, color: textColor),
                if (image != null) image!,
                if (icon != null || image != null) const SizedBox(width: 8),
                Text(label, style: TextStyle(color: textColor)),
              ],
            );

    final button = ElevatedButton(
      onPressed: isLoading ? null : onTap,
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        disabledBackgroundColor: backgroundColor.withOpacity(0.5),
        disabledForegroundColor: textColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(0, 50),
      ),
      child: buttonContent,
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}

import 'package:bakwan/common/style/ui.dart';
import 'package:flutter/material.dart';

class PrimaryConfirmationButton extends StatelessWidget {
  final String label;
  final double? width;
  final void Function()? onPressed;
  const PrimaryConfirmationButton({
    super.key,
    required this.label,
    this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: UIConst.primaryColor,
          foregroundColor: UIConst.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              UIConst.standardRad,
            ),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SecondaryConfirmationButton extends StatelessWidget {
  final String label;
  final double? width;
  final void Function()? onPressed;
  const SecondaryConfirmationButton({
    super.key,
    required this.label,
    this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: UIConst.white,
          foregroundColor: UIConst.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              UIConst.standardRad,
            ),
            side: BorderSide(
              color: UIConst.primaryColor,
            ),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

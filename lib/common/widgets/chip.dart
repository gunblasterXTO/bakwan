import 'package:bakwan/common/style/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final Color color;
  const CustomChip({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: UIConst.standardPadding * 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          UIConst.standardRad * 0.5,
        ),
        color: color,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.bodyMedium!.copyWith(
          color: UIConst.white,
        ),
      ),
    );
  }
}

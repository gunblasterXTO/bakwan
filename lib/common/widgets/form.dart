import 'package:bakwan/common/style/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownForm extends StatelessWidget {
  final String label;
  final String hint;
  final List<String> itemArray;
  final RxString state;

  const CustomDropDownForm({
    super.key,
    required this.label,
    required this.hint,
    required this.itemArray,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall,
        ),
        SizedBox(
          height: UIConst.standardGapHeight,
        ),
        DropdownButtonFormField(
          value: null,
          items: itemArray.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: context.textTheme.bodyMedium,
              ),
            );
          }).toList(),
          onChanged: (value) {
            state.value = value!;
          },
          hint: Text(
            hint,
            style: context.textTheme.bodyMedium!.copyWith(
              color: state.value.isNotEmpty ? Colors.black : Colors.grey,
            ),
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UIConst.standardRad),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: UIConst.standardPadding * 2,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomFreeTextForm extends StatelessWidget {
  final String label;
  final String hint;
  final RxString state;
  final int? maxLines;
  const CustomFreeTextForm({
    super.key,
    required this.label,
    required this.hint,
    required this.state,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall,
        ),
        SizedBox(
          height: UIConst.standardGapHeight,
        ),
        TextFormField(
          onChanged: (value) => state.value = value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UIConst.standardRad),
            ),
            hintText: hint,
            hintStyle: context.textTheme.bodyMedium!.copyWith(
              color: UIConst.hintTextColor,
            ),
          ),
          style: context.textTheme.bodyMedium!.copyWith(
            color: UIConst.formValueTextColor,
          ),
          maxLines: maxLines ?? 1,
        ),
      ],
    );
  }
}

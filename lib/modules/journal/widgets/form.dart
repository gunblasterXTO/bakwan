import 'package:bakwan/common/style/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTimePicker extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final RxString state;
  final String Function(TimeOfDay) parser;
  final double width;

  const CustomTimePicker({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.state,
    required this.parser,
    required this.width,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
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
            controller: controller,
            validator: validator,
            readOnly: true,
            onTap: () async {
              TimeOfDay? selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                initialEntryMode: TimePickerEntryMode.inputOnly,
                builder: (BuildContext context, Widget? child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: true),
                    child: child ?? Container(),
                  );
                },
              );
              if (selectedTime != null) {
                String parsedTime = parser(selectedTime);
                controller.text = parsedTime;
                state.value = parsedTime;
              }
            },
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UIConst.standardRad),
                borderSide: const BorderSide(color: Colors.black),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: UIConst.standardPadding * 2,
                vertical: UIConst.standardPadding * 2,
              ),
              hintText: hint,
              hintStyle: context.textTheme.bodyMedium!
                  .copyWith(color: UIConst.hintTextColor),
            ),
            style: context.textTheme.bodyMedium!.copyWith(
              color: UIConst.formValueTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

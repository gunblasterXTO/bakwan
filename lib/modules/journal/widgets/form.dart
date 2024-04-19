import 'package:bakwan/common/style/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTimePicker extends StatelessWidget {
  final String label;
  final String hint;
  final RxString state;
  final String Function(TimeOfDay) onChange;
  final double? width;

  const CustomTimePicker({
    super.key,
    required this.label,
    required this.hint,
    required this.state,
    required this.onChange,
    this.width,
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
        GestureDetector(
          child: Container(
            width: width ?? 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.7)),
              borderRadius: BorderRadius.circular(UIConst.standardRad),
            ),
            padding: EdgeInsets.all(UIConst.standardPadding * 2),
            child: Obx(() {
              return Text(
                state.value.isNotEmpty ? state.value : hint,
                textAlign:
                    state.value.isNotEmpty ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  color: state.value.isNotEmpty ? Colors.black : Colors.grey,
                ),
              );
            }),
          ),
          onTap: () async {
            TimeOfDay? selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              initialEntryMode: TimePickerEntryMode.inputOnly,
            );
            if (selectedTime != null) {
              state.value = onChange(selectedTime);
            }
          },
        ),
      ],
    );
  }
}

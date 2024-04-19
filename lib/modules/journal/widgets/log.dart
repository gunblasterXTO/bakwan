import 'package:bakwan/common/style/ui.dart';
import 'package:bakwan/common/widgets/chip.dart';
import 'package:flutter/material.dart';

class LogRecord extends StatelessWidget {
  final String mainTag;
  final Color mainTagColor;
  final String? subTag;
  final Color? subStagColor;
  final String description;
  final String recordDetail;
  const LogRecord({
    super.key,
    required this.mainTag,
    required this.mainTagColor,
    required this.description,
    required this.recordDetail,
    this.subTag,
    this.subStagColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Wrap(
            spacing: UIConst.standardSpacing,
            runSpacing: UIConst.standardSpacing,
            children: [
              CustomChip(
                text: mainTag,
                color: mainTagColor,
              ),
              if (subTag != null)
                CustomChip(
                  text: subTag!,
                  color: subStagColor!,
                ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            description,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            recordDetail,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

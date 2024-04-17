import 'package:bakwan/common/style/ui.dart';
import 'package:bakwan/common/widgets/chip.dart';
import 'package:flutter/material.dart';

class LogRecord extends StatelessWidget {
  final String mainTag;
  final String? subTag;
  final String description;
  final String recordDetail;
  const LogRecord({
    super.key,
    required this.mainTag,
    required this.description,
    required this.recordDetail,
    this.subTag,
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
                color: UIConst
                    .primaryColor, // TODO: color will be depends on category settings
              ),
              if (subTag != null)
                CustomChip(
                  text: subTag!,
                  color: UIConst
                      .primaryColor, // TODO: color will be depends on category settings
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

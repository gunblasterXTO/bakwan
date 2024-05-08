import 'package:bakwan/common/style/ui.dart';
import 'package:bakwan/modules/journal/widgets/log.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("April 16, 2024"),
            SizedBox(height: UIConst.standardGapHeight),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: UIConst.primaryColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(UIConst.standardRad),
              ),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(UIConst.standardPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LogRecord(
                      mainTag: "Work",
                      mainTagColor: Colors.green,
                      subTag: "Office",
                      subStagColor: Colors.grey,
                      description:
                          "This is a work that we do but this is not going anywhere else",
                      recordDetail: "1:16 hours",
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

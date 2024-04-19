import 'package:bakwan/common/style/ui.dart';
import 'package:bakwan/common/widgets/button.dart';
import 'package:bakwan/common/widgets/form.dart';
import 'package:bakwan/modules/journal/controllers/new_activity_controller.dart';
import 'package:bakwan/modules/journal/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewActivityPage extends StatelessWidget {
  const NewActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewActivityController c = Get.put(NewActivityController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          "New Activity",
          textAlign: TextAlign.left,
          style: context.textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(UIConst.standardPadding * 2),
            child: Column(
              children: [
                Form(
                  key: c.newActivityKey,
                  child: Column(
                    children: [
                      CustomDropDownForm(
                        label: "Category",
                        hint: "Select category",
                        itemArray: const [
                          // TODO: update with actual data
                          "test",
                          "train",
                        ],
                        state: c.state.category,
                      ),
                      SizedBox(
                        height: UIConst.standardGapHeight * 2,
                      ),
                      CustomDropDownForm(
                        label: "Sub Category",
                        hint: "Select sub category",
                        itemArray: const [
                          // TODO: update with actual data
                          "test",
                          "train",
                        ],
                        state: c.state.subCategory,
                      ),
                      SizedBox(
                        height: UIConst.standardGapHeight * 2,
                      ),
                      Row(
                        children: [
                          CustomTimePicker(
                            width: MediaQuery.of(context).size.width * 0.4,
                            label: "Start time",
                            hint: "Select start time",
                            state: c.state.startTime,
                            onChange: c.timeOfDaytoString,
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          CustomTimePicker(
                            width: MediaQuery.of(context).size.width * 0.4,
                            label: "End time",
                            hint: "Select end time",
                            state: c.state.endTime,
                            onChange: c.timeOfDaytoString,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: UIConst.standardGapHeight * 2,
                      ),
                      CustomFreeTextForm(
                        label: "Description",
                        hint: "Write description",
                        state: c.state.description,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: UIConst.standardGapHeight * 2,
                ),
                PrimaryConfirmationButton(
                  label: "Save",
                  onPressed: () {
                    print(c.state.category);
                    print(c.state.subCategory);
                    print(c.state.startTime);
                    print(c.state.endTime);
                    print(c.state.description);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

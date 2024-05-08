import 'package:bakwan/common/style/ui.dart';
import 'package:bakwan/common/widgets/button.dart';
import 'package:bakwan/common/widgets/form.dart';
import 'package:bakwan/database/instance.dart';
import 'package:bakwan/modules/journal/controllers/activity_controller.dart';
import 'package:bakwan/modules/journal/models/category.dart';
import 'package:bakwan/modules/journal/models/sub_category.dart';
import 'package:bakwan/modules/journal/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityFormPage extends StatelessWidget {
  const ActivityFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ActivityController c = Get.put(
      ActivityController(
        id: Get.arguments?["id"],
        db: Get.find<DBInstance>().database,
      ),
    );

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
                  key: c.activityKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      CustomFreeTextForm(
                        label: "Title",
                        hint: "Write activity title",
                        state: c.state.title,
                        controller: c.titleController,
                        validator: (value) => c.validateTitle(value!),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: UIConst.standardGapHeight * 2,
                      ),
                      CustomDropDownForm<CategoryModel>(
                        label: "Category",
                        hint: "Select category",
                        noDataHint: "No category available",
                        itemArray: c.getAllCategories(),
                        state: c.state.categoryId,
                        isDisabled: false,
                      ),
                      SizedBox(
                        height: UIConst.standardGapHeight * 2,
                      ),
                      Obx(() {
                        return CustomDropDownForm<SubCategoryModel>(
                          label: "Sub Category",
                          hint: "Select sub category",
                          noDataHint: "No sub category available",
                          itemArray: c.getAllSubCategories(
                            c.state.categoryId.toInt(),
                          ),
                          state: c.state.subCategoryId,
                          isDisabled: c.state.categoryId.toInt() == 0,
                        );
                      }),
                      SizedBox(
                        height: UIConst.standardGapHeight * 2,
                      ),
                      Row(
                        children: [
                          CustomTimePicker(
                            label: "Start time",
                            hint: "Select start time",
                            controller: c.startTimeController,
                            validator: (value) => c.validateStartEndTime(
                              value!,
                              c.state.endTime.value,
                            ),
                            state: c.state.startTime,
                            parser: c.formatDisplayTime,
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          CustomTimePicker(
                            width: MediaQuery.of(context).size.width * 0.4,
                            label: "End time",
                            hint: "Select end time",
                            controller: c.endTimeController,
                            validator: (value) => c.validateStartEndTime(
                              c.state.startTime.value,
                              value!,
                            ),
                            state: c.state.endTime,
                            parser: c.formatDisplayTime,
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
                    c.saveActivity(
                      title: c.state.title.value,
                      startTime: c.state.startTime.value,
                      endTime: c.state.endTime.value,
                      description: c.state.description.value,
                      categoryId: c.state.categoryId.value,
                      subCategoryId: c.state.subCategoryId.value,
                    );
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

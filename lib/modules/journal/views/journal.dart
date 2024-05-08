import 'package:bakwan/common/style/ui.dart';
import 'package:bakwan/modules/journal/views/activity.dart';
import 'package:bakwan/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // GREETINGS
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Hey, ",
                  style: context.textTheme.headlineMedium,
                ),
                TextSpan(
                  text:
                      "gunblasterXTO!👋🏽", // TODO: adjust with custom username
                  style: context.textTheme.headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // TAB
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(UIConst.appBarHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: UIConst.standardPadding * 3,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: UIConst.borderGreyColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    UIConst.standardRad * 2,
                  ), // Rounded corners
                  color: Colors.white, // Background color
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(UIConst.standardRad * 2),
                    color: UIConst.primaryColor,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: UIConst.secondaryColor,
                  labelStyle: context.textTheme.labelLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                  unselectedLabelColor: UIConst.primaryColor,
                  tabs: const [
                    Tab(
                      text: "Activity",
                    ),
                    Tab(
                      text: "Expense",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // TAB PAGE VIEW
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(UIConst.standardPadding * 2),
            child: const TabBarView(
              children: [ActivityPage(), Text("Expense")],
            ),
          ),
        ),
        // ADD NEW RECORD INITIAL ENTRY
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UIConst.standardRad * 2),
          ),
          backgroundColor: UIConst.primaryColor,
          foregroundColor: UIConst.white,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          spacing: UIConst.standardGapHeight,
          spaceBetweenChildren: UIConst.standardGapHeight,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.event),
              label: "Activity",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(UIConst.standardRad * 2),
              ),
              elevation: 0,
              onTap: () => Get.toNamed(Routes.activity, arguments: {}),
            ),
            SpeedDialChild(
              child: const Icon(Icons.attach_money),
              label: "Expense",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(UIConst.standardRad * 2),
              ),
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}

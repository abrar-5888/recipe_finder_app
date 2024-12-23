import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_app/app/components/bottom_bar_container_widget.dart';
import 'package:new_app/app/components/dummy_widget.dart';
import 'package:new_app/app/modules/bottom_bar/bottom_bar_controller.dart';
import 'package:new_app/app/modules/home_page/home_page_view.dart';

class MyBottomBarView extends StatelessWidget {
  const MyBottomBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      init: BottomBarController(),
      builder: (logic) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          bottomNavigationBar: Container(
            height: 60.h,
            color: Colors.white,
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (logic.bottomBarIndex.value != 0)
                      IconButton(
                        icon: const Icon(Icons.home_filled),
                        onPressed: () {
                          logic.bottomBarIndex.value = 0;
                        },
                      ),
                    if (logic.bottomBarIndex.value == 0) const BottomBarContainerWidget(text: "Home", icon: Icons.home_filled),
                    if (logic.bottomBarIndex.value != 1)
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          logic.bottomBarIndex.value = 1;
                        },
                      ),
                    if (logic.bottomBarIndex.value == 1) const BottomBarContainerWidget(text: "Search", icon: Icons.search),
                    if (logic.bottomBarIndex.value != 2)
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          logic.bottomBarIndex.value = 2;
                        },
                      ),
                    if (logic.bottomBarIndex.value == 2) const BottomBarContainerWidget(text: "Add", icon: Icons.add),
                    if (logic.bottomBarIndex.value != 3)
                      IconButton(
                        icon: const Icon(Icons.note_alt),
                        onPressed: () {
                          logic.bottomBarIndex.value = 3;
                        },
                      ),
                    if (logic.bottomBarIndex.value == 3) const BottomBarContainerWidget(text: "Menu", icon: Icons.note_alt),
                  ],
                )),
          ),
          body: Padding(padding: EdgeInsets.only(top: 30.h, bottom: 0), child: Obx(() => logic.bottomBarIndex.value == 0 ? const HomePageView() : const DummyWidget(text: "Dummy Page"))),
        );
      },
    );
  }
}

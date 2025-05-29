import 'package:deliveryapp/controller/homescreen_controller.dart';
import 'package:deliveryapp/data/data_source/static/bottom_appbar_pages.dart';
import 'package:deliveryapp/view/widgets/homeScreen/navigation_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends GetView<HomeScreenController> {
  const CustomBottomAppBar({super.key, required this.myColors});

  final ColorScheme myColors;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      height: 55,
      color: myColors.onPrimary,
      child: Row(
        children: [
          ...List.generate(navigationButtonsList.length + 1, (index) {
            int i = index > 2 ? index - 1 : index;
            return index == 2
                ? Spacer()
                : index > 0
                ? BottomAppbarButton(
                  isActive: controller.currentIndex.value == i,
                  title: navigationButtonsList[i].title,
                  icon: navigationButtonsList[i].icon,
                  onPressed: () {
                    if (controller.currentIndex.value != i) {
                      navigationButtonsList[i].onPressed!();
                    }
                    controller.changePage(i);
                  },
                )
                : Container();
          }),
        ],
      ),
    );
  }
}

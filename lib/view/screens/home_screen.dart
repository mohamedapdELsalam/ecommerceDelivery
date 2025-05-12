import 'package:deliveryapp/controller/homescreen_controller.dart';
import 'package:deliveryapp/core/functions/alert_exit.dart';
import 'package:deliveryapp/core/screen_dimensions.dart';
import 'package:deliveryapp/view/widgets/homeScreen/floating_action_button.dart';
import 'package:deliveryapp/view/widgets/homeScreen/navigation_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = Theme.of(context).colorScheme;
    HomeScreenController controller = Get.put(HomeScreenController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:
          (didPop, result) => alertExit(
            context,
            "warn ",
            " do you want to exit ?",
            "exit",
            "cancel",
          ),
      child: Obx(
        () => Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: controller.pagesList.elementAt(controller.currentIndex.value),
          floatingActionButton:
              Responsible.isMobile(context)
                  ? MyFloatingActionButton(
                    controller: controller,
                    mycolors: myColors,
                  )
                  : null,
          bottomNavigationBar:
              Responsible.isMobile(context)
                  ? CustomBottomAppBar(myColors: myColors)
                  : null,
        ),
      ),
    );
  }
}

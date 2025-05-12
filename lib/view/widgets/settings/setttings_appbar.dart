
import 'package:deliveryapp/core/screen_dimensions.dart';
import 'package:flutter/material.dart';

class SettingsAppbarHomepage extends StatelessWidget {
  const SettingsAppbarHomepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    var myColors = Theme.of(context).colorScheme;
    // var myTheme = Get.theme;
    //outside container
    return Container(
      padding: Responsible.isMobile(context)
          ? EdgeInsets.only(top: 20)
          : EdgeInsets.only(top: 10),
      width: appWidth,
      height: Responsible.isDesktop(context)
          ? appHeight * 0.25
          : Responsible.isMobile(context)
              ? appHeight * 0.2
              : Responsible.isPortrait(context)
                  ? appHeight * 0.35
                  : appHeight * 0.25,
      decoration: BoxDecoration(
          color: myColors.primary,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(28))),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // const curvyLines(),
          // const CircleDots(),
          //inside content
          Container(
            constraints: BoxConstraints(minWidth: 100, minHeight: 100),
            margin: EdgeInsets.symmetric(
              horizontal: appWidth - (appWidth - 30),
              vertical: appHeight - (appHeight - 15),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Positioned(
          //   bottom: -30,
          //   right: 1,
          //   left: 1,
          //   child: Center(
          //     child: Container(
          //       padding: EdgeInsets.all(3),
          //       decoration: BoxDecoration(
          //           color: Theme.of(context).scaffoldBackgroundColor,
          //           borderRadius: BorderRadius.all(Radius.circular(100))),
          //       child: CircleAvatar(
          //           radius: 25,
          //           child: Icon(
          //             Icons.settings,
          //             size: 30,
          //             color: Colors.white,
          //           )),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

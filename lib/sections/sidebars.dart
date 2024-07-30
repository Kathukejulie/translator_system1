import 'package:get/get.dart';

import 'package:translator_app/constants/const.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/routes.dart';
import 'package:translator_app/widgets/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

Widget sidebar(BuildContext context) {
  return ResponsiveWrapper.of(context).isSmallerThan(TABLET)
      ? Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.bars,
              size: 20,
              color: textColor,
            ),
          ),
        )
      : Container(
          color: myPrimaryColor,
          width: ResponsiveWrapper.of(context).isTablet ? 50 : 350,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              sidebarAccountMenuList(context),
              sidebarMainMenuList(context),
            ],
          ),
        );
}

Column sidebarAccountMenuList(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 20,
      ),
      Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        color: myPrimaryColor,
        child: Text(
          "Translate App",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      )

      // ResponsiveWrapper.of(context).isTablet
      //     ? Divider(color: myPrimaryColor)
      //     : Container(
      //         padding: const EdgeInsets.all(10),
      //         width: double.infinity,
      //         color: HexColor("#161719"),
      //         child: ListTile(
      //           leading: Text(
      //             "Account status",
      //             style: TextStyle(
      //               color: textColor,
      //               fontWeight: FontWeight.w200,
      //               fontSize: 12,
      //             ),
      //           ),
      //           trailing: Container(
      //             margin: const EdgeInsets.all(5.0),
      //             child: MaterialButton(
      //                 onPressed: () {},
      //                 color: Colors.green,
      //                 child: Text(
      //                   "Active",
      //                   style: TextStyle(
      //                     color: textColor,
      //                     fontWeight: FontWeight.w200,
      //                     fontSize: 12,
      //                   ),
      //                 )),
      //           ),
      //         ),
      //       ),
    ],
  );
}

ResponsiveRowColumn sidebarMainMenuList(BuildContext context) {
  return ResponsiveRowColumn(
    rowMainAxisAlignment: MainAxisAlignment.start,
    rowCrossAxisAlignment: CrossAxisAlignment.start,
    columnMainAxisAlignment: MainAxisAlignment.start,
    columnCrossAxisAlignment: CrossAxisAlignment.start,
    layout: ResponsiveRowColumnType.COLUMN,
    children: [
      const ResponsiveRowColumnItem(child: SizedBox(height: 60)),
      authenticationController.isLoggedIn.value
          ? ResponsiveRowColumnItem(
              child: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? mobilesidebarButton(FontAwesomeIcons.user)
                  : desktopsidebarButton(
                      context,
                      authenticationController.loggedInUser.value!.fullName
                          .split(" ")[0],
                      FontAwesomeIcons.userAlt,
                      "",
                      false,
                      home),
            )
          : ResponsiveRowColumnItem(
              child: Container(),
            ),
      // ResponsiveRowColumnItem(
      //   child: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
      //       ? mobilesidebarButton(FontAwesomeIcons.moneyBillWaveAlt)
      //       : desktopsidebarButton(
      //           context,
      //           "balance",
      //           FontAwesomeIcons.moneyBillWaveAlt,
      //           "\$792.05",
      //           false,
      //           accountPaymentAndTransactionsPage),
      // ),
      // ResponsiveRowColumnItem(
      //   child: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
      //       ? mobilesidebarButton(FontAwesomeIcons.bell)
      //       : desktopsidebarButton(context, "notifications",
      //           FontAwesomeIcons.bell, "", true, notificationsPage),
      // ),
      // ResponsiveRowColumnItem(
      //     child: Divider(color: textColor.withOpacity(0.3))),
      authenticationController.isLoggedIn.isTrue
          ? ResponsiveRowColumnItem(
              child: ordersDesktopsidebarButton(
                  context,
                  "ongoing projects",
                  FontAwesomeIcons.clipboardCheck,
                  "",
                  false,
                  myProjects,
                  false),
            )
          : emptyResponsiveColumnItem(),
      // ResponsiveRowColumnItem(
      //   child: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
      //       ? mobilesidebarButton(FontAwesomeIcons.userCheck)
      //       : desktopsidebarButton(context, "my bids",
      //           FontAwesomeIcons.userCheck, "", true, myBids),
      // ),
      authenticationController.isLoggedIn.isTrue
          ? ResponsiveRowColumnItem(
              child: ordersDesktopsidebarButton(context, "completed projects",
                  FontAwesomeIcons.userCheck, "", false, myProjects, true),
            )
          : emptyResponsiveColumnItem(),
      // ResponsiveRowColumnItem(
      //   child: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
      //       ? mobilesidebarButton(FontAwesomeIcons.infoCircle)
      //       : desktopsidebarButton(context, "rules & tips",
      //           FontAwesomeIcons.infoCircle, "", false, rulesAndTipsPage),
      // ),
      authenticationController.isLoggedIn.isTrue
          ? ResponsiveRowColumnItem(
              child: desktopsidebarButton(context, "my contracts",
                  FontAwesomeIcons.clipboardList, "", true, myContracts),
            )
          : ResponsiveRowColumnItem(child: Container()),
      authenticationController.isLoggedIn.isTrue
          ? authenticationController.loggedInUser.value!.isWriter
              ? emptyResponsiveColumnItem()
              : ResponsiveRowColumnItem(
                  child: Divider(color: textColor.withOpacity(0.3)))
          : emptyResponsiveColumnItem(),
      authenticationController.isLoggedIn.isTrue &&
              !authenticationController.loggedInUser.value!.isWriter
          ? ResponsiveRowColumnItem(
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () =>
                      Navigator.pushNamed(context, createNewProject),
                  child: Text(
                    "New Request",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ))
          : emptyResponsiveColumnItem(),
      // ResponsiveRowColumnItem(
      //   child: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
      //       ? mobilesidebarButton(FontAwesomeIcons.commentDots)
      //       : desktopsidebarButton(context, "chats",
      //           FontAwesomeIcons.commentDots, "", false, home),
      // ),
      // ResponsiveRowColumnItem(
      //   child: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
      //       ? mobilesidebarButton(FontAwesomeIcons.star)
      //       : desktopsidebarButton(
      //           context, "position in rating", FontAwesomeIcons.star, "120", false, home),
      // ),
      // ResponsiveRowColumnItem(
      //   child: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
      //       ? mobilesidebarButton(FontAwesomeIcons.comment)
      //       : desktopsidebarButton(context, "help center",
      //           FontAwesomeIcons.comments, "", false, home),
      // ),

      authenticationController.isLoggedIn.isTrue
          ? ResponsiveRowColumnItem(
              child: Divider(color: textColor.withOpacity(0.3)))
          : emptyResponsiveColumnItem(),
      authenticationController.isLoggedIn.isTrue
          ? ResponsiveRowColumnItem(
              child: desktopsidebarButton(
                  context, "Logout", Icons.logout, "", false, signin),
            )
          : ResponsiveRowColumnItem(
              child: desktopsidebarButton(
                  context, "Login", Icons.logout, "", false, signin),
            ),
    ],
  );
}

ResponsiveRowColumnItem emptyResponsiveColumnItem() {
  return ResponsiveRowColumnItem(
    child: Container(),
  );
}

// Widget chatSidebar(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       decoration: BoxDecoration(
//           color: mySecondaryColor, borderRadius: BorderRadius.circular(10)),
//       width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 0 : 320,
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const SizedBox(height: 100),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.call,
//                 size: 50,
//                 color: Colors.blueAccent,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: customText(
//                   text: "You can reach us on:",
//                   font: 12,
//                   weight: FontWeight.bold,
//                   textColor: Colors.grey),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: customText(
//                   text: "07******",
//                   font: 12,
//                   weight: FontWeight.bold,
//                   textColor: textColor),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

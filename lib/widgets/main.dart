import 'dart:math';

import 'package:intl/intl.dart';
import 'package:translator_app/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:translator_app/features/contracts/domain/entities/contract.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:translator_app/routes.dart';
import 'package:translator_app/features/users_system/domain/entities/user.dart';

Widget desktopsidebarButton(
    BuildContext context,
    String text,
    IconData awesomeIcons,
    String indicatorText,
    bool isNotification,
    String pathToLink) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextButton.icon(
      onPressed: () => Navigator.pushReplacementNamed(context, pathToLink),
      icon: Icon(awesomeIcons, color: textColor, size: 12),
      label: Row(
        children: [
          Text(
            text.toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Expanded(child: SizedBox()),
          indicatorText.isNotEmpty
              ? Text(
                  indicatorText,
                  style: TextStyle(
                    fontSize: 13,
                    color: textColor,
                    fontWeight: FontWeight.w300,
                  ),
                )
              : isNotification
                  ? Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 76, 0, 255),
                      ),
                      child: const Text(
                        "",
                        style: TextStyle(fontSize: 7),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mySecondaryColor.withOpacity(0),
                      ),
                      child: const Text(
                        "",
                        style: TextStyle(fontSize: 7),
                      ),
                    ),
        ],
      ),
    ),
  );
}

Widget ordersDesktopsidebarButton(
    BuildContext context,
    String text,
    IconData awesomeIcons,
    String indicatorText,
    bool isNotification,
    String pathToLink,
    bool status) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextButton.icon(
      onPressed: () => Navigator.pushReplacementNamed(context, pathToLink,
          arguments: status),
      icon: Icon(awesomeIcons, color: textColor, size: 12),
      label: Row(
        children: [
          Text(
            text.toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Expanded(child: SizedBox()),
          indicatorText.isNotEmpty
              ? Text(
                  indicatorText,
                  style: TextStyle(
                    fontSize: 13,
                    color: textColor,
                    fontWeight: FontWeight.w300,
                  ),
                )
              : isNotification
                  ? Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 76, 0, 255),
                      ),
                      child: const Text(
                        "",
                        style: TextStyle(fontSize: 7),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mySecondaryColor.withOpacity(0),
                      ),
                      child: const Text(
                        "",
                        style: TextStyle(fontSize: 7),
                      ),
                    ),
        ],
      ),
    ),
  );
}

IconButton mobilesidebarButton(IconData icon) {
  return IconButton(
    onPressed: () {},
    icon: Icon(
      icon,
      color: textColor,
      size: 14,
    ),
  );
}

Widget projectTableTitleRow() {
  return Table(
    children: [
      TableRow(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(5),
          color: mySecondaryColor,
          border: BorderDirectional(
            bottom: BorderSide(
              color: textColor,
              width: 2,
            ),
          ),
        ),
        children: [
          tableCell("Title", isHeader: true),
          tableCell("Translator", isHeader: true),
          tableCell("Price", isHeader: true),
          tableCell("Word count", isHeader: true),
          tableCell("Action", isHeader: true),
        ],
      ),
    ],
  );
}

TableRow projectTableRow(
    {required BuildContext context,
    required TranslationProjectDataEntity order}) {
  return TableRow(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: mySecondaryColor,
        border: BorderDirectional(
            bottom: BorderSide(
          color: textColor,
        ))),
    children: [
      tableCell(order.title),
      tableCell(order.writerName),
      tableCell(order.price.toString()),
      tableCell('${order.words} words'),
      GestureDetector(
          onTap: () => Navigator.pushNamed(context, mainprojectDetails,
              arguments: order),
          child: tableCell("View")),
    ],
  );
}

TableCell tableCell(
  String text, {
  bool isHeader = false,
}) {
  return TableCell(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: isHeader ? Colors.white : textColor,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 16 : 14,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget projectTileCard(
    {required BuildContext context,
    required TranslationProjectDataEntity order}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5.0),
    child: GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, mainprojectDetails, arguments: order),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        tileColor: mySecondaryColor,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                order.title,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ),
            const Expanded(child: Text("")),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                order.price.toString(),
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(
              Random().nextInt(9999999).toString(),
              style: TextStyle(
                color: inactiveLinkTextColor,
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
            ),
            const SizedBox(width: 7),
            Text(
              "${order.words} words",
              style: TextStyle(
                color: inactiveLinkTextColor,
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
            ),
            const SizedBox(width: 7),
            Text(
              order.task,
              style: TextStyle(
                color: inactiveLinkTextColor,
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
            ),
            const Expanded(
              child: Text(""),
            ),
            Text(
              order.deadline.toString(),
              style: TextStyle(
                color: inactiveLinkTextColor,
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
            ),
          ],
        ),
        // trailing: Icon(
        //   FontAwesomeIcons.ellipsisV,
        //   color: textColor,
        //   size: 15,
        // ),
      ),
    ),
  );
}

Widget writerSummaryTileCard(BuildContext context, UserDataEntity user) {
  return Container(
    decoration: BoxDecoration(
      color: mySecondaryColor,
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.all(8),
    child: GestureDetector(
      onTap: () => Navigator.pushNamed(context, mainprojectDetails),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: mySecondaryColor,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: customText(
                          text: user.fullName,
                          font: 12,
                          weight: FontWeight.w400,
                          textColor: textColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0, top: 4),
                        child: customText(
                          text: user.email,
                          font: 12,
                          weight: FontWeight.w400,
                          textColor: textColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: customText(
                          text: "20+ Completed orders",
                          font: 12,
                          weight: FontWeight.w400,
                          textColor: alttextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, createNewProject),
                child: customText(
                    text: "Invite",
                    font: 14,
                    weight: FontWeight.w400,
                    textColor: textColor)),
          )
        ],
      ),
    ),
  );
}

Widget contractSummaryTileCard(
    BuildContext context, ContractDataEntity contract) {
  return Container(
    decoration: BoxDecoration(
      color: mySecondaryColor,
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.all(8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: mySecondaryColor,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: customText(
                        text: contract.projectTitle,
                        font: 12,
                        weight: FontWeight.w400,
                        textColor: textColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0, top: 4),
                      child: customText(
                        text: contract.amount + " kshs",
                        font: 12,
                        weight: FontWeight.w400,
                        textColor: textColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: customText(
                        text: contract.isCompleted ? "Closed" : "Active",
                        font: 12,
                        weight: FontWeight.w400,
                        textColor: alttextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextButton(
        //       style: TextButton.styleFrom(
        //           backgroundColor: Colors.blue,
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(5))),
        //       onPressed: () =>
        //           Navigator.pushReplacementNamed(context, createNewOrderPage),
        //       child: customText(
        //           text: "Invite",
        //           font: 14,
        //           weight: FontWeight.w400,
        //           textColor: textColor)),
        // )
      ],
    ),
  );
}

Text customText(
    {required String text,
    required double font,
    required FontWeight weight,
    required Color textColor}) {
  return Text(
    text,
    style: TextStyle(
      color: textColor,
      fontWeight: weight,
      fontSize: font,
    ),
  );
}

Widget chatTileCard() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "788917 Discussion",
              style: TextStyle(fontSize: 11),
            ),
            const Expanded(child: SizedBox()),
            Text(
              "14 hours ago",
              style: TextStyle(fontSize: 11, color: greytextColor),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "You: lorem ipsum dolor sit amet lorem  lorem ipsum dolor sit amet lorem  lorem ipsum dolor lorem ipsum dolor sit amet lorem  lorem ipsum dolor sit amet lorem  lorem ipsum dolor lorem ipsum dolor sit amet lorem  lorem ipsum dolor sit amet lorem  lorem ipsum dolor",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                  strutStyle: StrutStyle(height: 1.2),
                ),
              ),
            ),
            Icon(
              Icons.arrow_right_sharp,
            ),
          ],
        ),
        Divider(color: myPrimaryColor.withOpacity(0.2)),
      ],
    ),
  );
}

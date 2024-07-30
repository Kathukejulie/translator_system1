// import 'package:translator_app/constants/const.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_framework/responsive_framework.dart';

// Padding projectSummaryCardSubjectAndTopicsRow(
//     BuildContext context, String topic, String subject) {
//   return Padding(
//     padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
//     child: ResponsiveRowColumn(
//       rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
//       layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
//           ? ResponsiveRowColumnType.COLUMN
//           : ResponsiveRowColumnType.ROW,
//       children: [
//         ResponsiveRowColumnItem(
//           child: Text(
//             topic,
//             style: TextStyle(
//               fontSize: 11,
//               color: inactiveLinkTextColor,
//             ),
//           ),
//         ),
//         ResponsiveRowColumnItem(
//           child: Text(
//             subject,
//             style: TextStyle(
//               fontSize: 11,
//               color: textColor,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

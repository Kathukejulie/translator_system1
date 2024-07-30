import 'package:translator_app/constants/const.dart';
import 'package:translator_app/features/contracts/domain/entities/contract.dart';
import 'package:translator_app/features/contracts/ui/contract_details/sections/reusables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:translator_app/routes.dart';

Widget closeContractSection({required ContractDataEntity contract}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 10),
      color: mySecondaryColor,
      padding: const EdgeInsets.all(10),
      // constraints: const BoxConstraints(maxHeight: 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price KES ${contract.amount}",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: textColor,
                  fontSize: 15,
                ),
              ),
              Icon(
                FontAwesomeIcons.ellipsisV,
                color: inactiveLinkTextColor,
                size: 15,
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                color: Colors.red,
                onPressed: () {},
                child: Text(
                  "Close Contract",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget contractSummaryCard(BuildContext context, {required ContractDataEntity contract}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 10),
      color: mySecondaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius:
                          ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                              ? 15
                              : 20,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "526551",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                              fontSize: ResponsiveWrapper.of(context)
                                      .isSmallerThan(DESKTOP)
                                  ? 10
                                  : 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "English US",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                              fontSize: ResponsiveWrapper.of(context)
                                      .isSmallerThan(DESKTOP)
                                  ? 10
                                  : 11.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "100%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          fontSize: ResponsiveWrapper.of(context)
                                  .isSmallerThan(DESKTOP)
                              ? 10
                              : 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Acceptance rate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.grey.shade500,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "89%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          fontSize: ResponsiveWrapper.of(context)
                                  .isSmallerThan(DESKTOP)
                              ? 10
                              : 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Pay rate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.grey.shade500,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "180",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          fontSize: ResponsiveWrapper.of(context)
                                  .isSmallerThan(DESKTOP)
                              ? 10
                              : 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Orders",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.grey.shade500,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "3:39 AM",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          fontSize: ResponsiveWrapper.of(context)
                                  .isSmallerThan(DESKTOP)
                              ? 10
                              : 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Customer local time",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.grey.shade500,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget chatWithClientCard(BuildContext context) {
  return Flexible(
    child: Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 35 : 55,
      color: mySecondaryColor,
      child: Center(
        child: Text(
          "Chat is not available at the moment",
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: inactiveLinkTextColor,
            fontSize: 10,
          ),
        ),
      ),
    ),
  );
}

// Widget orderSummaryCard(BuildContext context,
//     {required TranslationProjectDataEntity order}) {
//   return Container(
//     color: mySecondaryColor,
//     padding: const EdgeInsets.all(10.0),
//     margin: const EdgeInsets.only(left: 10.0, right: 10.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     orderSummaryCardSubjectAndTopicsRow(
//                         context, "Task:", order.task),
//                     Divider(color: dividerColor),
//                     orderSummaryCardSubjectAndTopicsRow(context, "Pages/words:",
//                         "${order.words} words (Double spacing)"),
//                     Divider(color: dividerColor),
//                     orderSummaryCardSubjectAndTopicsRow(
//                         context, "Citation Style:", order.citationStyle),
//                     Divider(color: dividerColor),
//                     orderSummaryCardSubjectAndTopicsRow(context, "Min. price:",
//                         "KES ${order.price.toStringAsFixed(2)}"),
//                     Divider(color: dividerColor),
//                     orderSummaryCardSubjectAndTopicsRow(
//                         context, "Current Language:", order.currentLanguage),
//                     Divider(color: dividerColor),
//                   ],
//                 ),
//               ),
//             ),
//             // const SizedBox(width: 20, height: double.infinity),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   // physics: const NeverScrollableScrollPhysics(),
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     orderSummaryCardSubjectAndTopicsRow(
//                         context, " Service:", order.service),
//                     Divider(color: dividerColor),
//                     orderSummaryCardSubjectAndTopicsRow(
//                         context, "Education Level:", "N/A"),
//                     Divider(color: dividerColor),
//                     orderSummaryCardSubjectAndTopicsRow(
//                         context, "Subject:", order.subject),
//                     Divider(color: dividerColor),
//                     orderSummaryCardSubjectAndTopicsRow(context,
//                         "Your Deadline:", formatter.format(order.deadline)),
//                     Divider(color: dividerColor),
//                     orderSummaryCardSubjectAndTopicsRow(
//                         context, "Final Language:", order.finalLanguage),
//                     Divider(color: dividerColor),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Attached files: 5",
//                     style: TextStyle(
//                       fontSize: 11,
//                       color: inactiveLinkTextColor,
//                     ),
//                   ),
//                   const Text(
//                     "View files",
//                     style: TextStyle(
//                       fontSize: 11,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//         Divider(color: dividerColor),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             "Description",
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               color: textColor,
//               fontSize: 12,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             order.description,
//             textAlign: TextAlign.left,
//             strutStyle: const StrutStyle(
//               height: 1.5,
//             ),
//             style: TextStyle(
//               color: textColor.withOpacity(0.8),
//               fontSize: 11,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     ),
//   );
// }

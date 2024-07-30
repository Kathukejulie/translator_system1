
import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/features/contracts/ui/sections/my_contracts_section.dart';
import 'package:translator_app/sections/sidebars.dart';

class MainContractsPage extends StatelessWidget {
  const MainContractsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPrimaryColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sidebar(context),
          Expanded(
            child: Container(
              color: myPrimaryColor,
              padding: const EdgeInsets.all(15),
              child: const MyContractsSection(),
            ),
          ),
          // chatSidebar(context),
        ],
      ),
    );
  }
}

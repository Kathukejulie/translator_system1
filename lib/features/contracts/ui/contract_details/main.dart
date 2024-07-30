import 'package:translator_app/constants/const.dart';
import 'package:translator_app/features/contracts/domain/entities/contract.dart';
import 'package:translator_app/features/contracts/ui/contract_details/contract_details_page.dart';
import 'package:translator_app/features/translation_project/domain/entities/project.dart';
import 'package:translator_app/features/translation_project/ui/project_details/project_details_page.dart';
import 'package:translator_app/sections/sidebars.dart';
import 'package:flutter/material.dart';

class MainContractDetailsPage extends StatelessWidget {
  final ContractDataEntity contract;
  const MainContractDetailsPage({Key? key, required this.contract}) : super(key: key);

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
            child: MainContractPage(contract: contract),
          ),
          // chatSidebar(context),
        ],
      ),
    );
  }
}

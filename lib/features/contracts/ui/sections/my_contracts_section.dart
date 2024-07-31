import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/contracts/domain/entities/contract.dart';
import 'package:translator_app/features/users_system/domain/entities/user.dart';
import 'package:translator_app/widgets/main.dart';

class MyContractsSection extends StatefulWidget {
  const MyContractsSection({Key? key}) : super(key: key);

  @override
  State<MyContractsSection> createState() => _MyContractsSectionState();
}

class _MyContractsSectionState extends State<MyContractsSection>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: myPrimaryColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: Text(
            "all contracts".toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Scaffold(
            backgroundColor: myPrimaryColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: myPrimaryColor,
              elevation: 0,
            ),
            body: StreamBuilder(
                stream: contractsController.getAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final contracts = snapshot.data!;
                    return ListView(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Invoice Number:",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                authenticationController
                                    .loggedInUser.value!.invoiceNumber,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              authenticationController
                                          .loggedInUser.value!.isWriter ==
                                      true
                                  ? "Current Earnings:"
                                  : "Account Statements Total:",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${contracts.where((element) => (authenticationController.loggedInUser.value!.isWriter == true ? element['writerId'] : element['managerId']) == firebaseAuth.currentUser!.uid).fold(0.0, (previousValue, element) => previousValue + double.parse(element['amount'])).toStringAsFixed(2)} Kshs",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                            children: contracts
                                .where((element) =>
                                    (authenticationController
                                                .loggedInUser.value!.isWriter ==
                                            true
                                        ? element['writerId']
                                        : element['managerId']) ==
                                    firebaseAuth.currentUser!.uid)
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: contractSummaryTileCard(context,
                                          ContractDataEntity.fromJson(e)),
                                    ))
                                .toList()),
                      ],
                    );
                  } else {
                    return Container();
                  }
                })),
      ),
    );
  }
}

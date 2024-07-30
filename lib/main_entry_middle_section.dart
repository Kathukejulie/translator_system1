import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/widgets/main.dart';

class MainEntryMiddleSection extends StatelessWidget {
  const MainEntryMiddleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPrimaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(
                    text: "Localisation Project Tracker",
                    font: 30,
                    weight: FontWeight.w800,
                    textColor: greytextColor),
                customText(
                    text: "Translate your projects easily",
                    font: 30,
                    weight: FontWeight.w800,
                    textColor: greytextColor),
                // const SizedBox(height: 20),
                // singlePromoCard(context),
                // singlePromoCard(context),
                // singlePromoCard(context),
              ]),
        ),
      ),
    );
  }

  Container singlePromoCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: mySecondaryColor, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: myThirdColor,
                    borderRadius: BorderRadius.circular(7)),
                height: 40,
                width: 40,
                child: Center(child: Icon(Icons.star)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: customText(
                        text: "Lorem Ipsum",
                        font: 12,
                        weight: FontWeight.bold,
                        textColor: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: customText(
                          text:
                              'Dolore ut aute excepteur laboris ut ad laborum ea magna dolor sint dolor incididunt. Id in reprehenderit do ad enim in aliqua et esse Lorem magna. Consequat excepteur consectetur tempor labore nulla. Non occaecat occaecat ea non proident sit esse voluptate officia consequat adipisicing deserunt nisi laboris.',
                          font: 12,
                          weight: FontWeight.bold,
                          textColor: Colors.grey),
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
}

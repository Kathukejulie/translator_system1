import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/features/users_system/domain/entities/user.dart';
import 'package:translator_app/widgets/main.dart';

class MyWritersSection extends StatefulWidget {
  const MyWritersSection({Key? key}) : super(key: key);

  @override
  State<MyWritersSection> createState() => _MyWritersSectionState();
}

class _MyWritersSectionState extends State<MyWritersSection>
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
            "all translators".toUpperCase(),
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
                stream: usersController.getAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final users = snapshot.data!;
                    // print(users[0]);
                    return ListView(
                        children: users
                            .where((element) => element['isWriter'] == true)
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: writerSummaryTileCard(
                                      context, UserDataEntity.fromJson(e)),
                                ))
                            .toList());
                  } else {
                    return Container();
                  }
                })),
      ),
    );
  }
}

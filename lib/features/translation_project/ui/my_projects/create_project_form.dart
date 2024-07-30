// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import 'package:translator_app/constants/const.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/routes.dart';

class CreateProjectFormOne extends StatefulWidget {
  @override
  _CreateProjectFormStateOne createState() => _CreateProjectFormStateOne();
}

class _CreateProjectFormStateOne extends State<CreateProjectFormOne> {
  final _formKey = GlobalKey<FormState>();
  int? _words;
  String? _service;
  String? _citationStyle;
  String? _taskType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //               Padding(
              //   padding: const EdgeInsets.all(6.0),
              //   child: Text(
              //     'Task type',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 12.0,
              //       color: textColor,
              //     ),
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: HexColor("#33353c"),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: DropdownButtonFormField<String>(
              //     dropdownColor: myThirdColor,
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 12.0,
              //       color: textColor,
              //     ),
              //     value: _taskType,
              //     onChanged: (value) {
              //       setState(() {
              //         _taskType = value;
              //       });
              //       if (value!.isNotEmpty) {
              //         newProjectController.task.value = value;
              //       }
              //     },
              //     items: const [
              //       DropdownMenuItem(
              //         value: 'Code Documentation',
              //         child: Text(
              //           'Code Documentation',
              //         ),
              //       ),
              //       DropdownMenuItem(
              //         value: 'Project Requirements',
              //         child: Text(
              //           'Project Requirements',
              //         ),
              //       ),
              //       // Add more assignment types here
              //     ],
              //     decoration: InputDecoration(
              //       contentPadding: const EdgeInsets.all(8),
              //       hintText: 'Task type',
              //       hintStyle: TextStyle(
              //         // fontWeight: FontWeight.bold,
              //         fontSize: 12.0,
              //         color: textColor,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _service,
                      dropdownColor: myThirdColor,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: textColor,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _service = value;
                        });
                        if (value!.isNotEmpty) {
                          newProjectController.service.value = value;
                        }
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 'Services',
                          child: Text(
                            'Services',
                            // style: TextStyle(color: textColor),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Reviewing',
                          child: Text(
                            'Reviewing',
                            // style: TextStyle(color: textColor),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Translation',
                          child: Text(
                            'Translation',
                            // style: TextStyle(color: textColor),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Editing',
                          child: Text(
                            'Editing',
                            // style: TextStyle(color: textColor),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'copywriting',
                          child: Text(
                            'copywriting',
                            // style: TextStyle(color: textColor),
                          ),
                        ),
                        // Add more options here
                      ],
                      decoration: InputDecoration(
                        hintText: 'Services',
                        hintStyle: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(width: 16.0),
                  // Expanded(
                  //   child: DropdownButtonFormField<String>(
                  //     dropdownColor: myThirdColor,
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 12.0,
                  //       color: textColor,
                  //     ),
                  //     value: _citationStyle,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _citationStyle = value;
                  //       });
                  //       if (value!.isNotEmpty) {
                  //         newProjectController.citationStyle.value = value;
                  //       }
                  //     },
                  //     items: const [
                  //       DropdownMenuItem(
                  //         value: 'APA',
                  //         child: Text('APA'),
                  //       ),
                  //       DropdownMenuItem(
                  //         value: 'MLA',
                  //         child: Text('MLA'),
                  //       ),
                  //       // Add more citation styles here
                  //     ],
                  //     decoration: InputDecoration(
                  //       hintText: 'Citation style',
                  //       hintStyle: TextStyle(
                  //         // fontWeight: FontWeight.bold,
                  //         fontSize: 12.0,
                  //         color: textColor,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                    color: mySecondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 12.0,
                    color: textColor,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      var amount = double.parse(value);
                      newProjectController.price.value = amount;
                      newContractController.amount.value =
                          amount.toStringAsFixed(2);
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    hintText: 'Min. price',
                    hintStyle: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                    color: mySecondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 12.0,
                    color: textColor,
                   ),
                  initialValue: _words?.toString(),
                  onChanged: (value) {
                    setState(() {
                      _words = int.tryParse(value);
                    });

                    newProjectController.words.value = _words.toString();
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    hintText: 'No. of words',
                    hintStyle: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // TextButton(
                  //   onPressed: () {
                  //     // Handle Back button press
                  //   },
                  //   child: const Text('Back'),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        createNewProjectPageTwo,
                      );
                    },
                    child: const Text('Next Step'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:busmate/Screens/ticket_details.dart';
import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';

import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  @override
  List _places = ['Aluva', 'Vyttila'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGreenMainTheme,
        body: Column(
          children: [
            Expanded(
                //1
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  // height: double.infinity,
                  // width: double.infinity,
                  color: kGreenMainTheme,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: 10,),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Scan Ticket',
                                      style: kWhiteHeadingSize,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "12-Jun-13",
                                      style: kGreyTextStyle,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

                      //  SizedBox(height: 20,),
                      Expanded(
                        flex: 0,
                        child: Container(
                          //color: Color.fromARGB(255, 178, 95, 95),
                          child: Column(
                            children: [
                              Image(
                                  height: 100,
                                  image:
                                      AssetImage('assets/images/ticket.png')),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      //SizedBox(height: 40,),
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Conductor ID: ",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("Name: ",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            // SizedBox(height: 10,),
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 11),
                              child: const Text(
                                "ROUTE",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Select a route',
                                  hintStyle: TextStyle(
                                    color: kGreyTextColor,
                                  )),
                              style: kWhiteHeadingSize.copyWith(
                                  color: Colors.black),
                              items: _places.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(e,
                                          style: kWhiteHeadingSize.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600))),
                                );
                              }).toList(),
                              dropdownColor: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                              onChanged: (Object? value) {
                                print(value);
                              },
                            ),
                          )
                        ]))),
            const SizedBox(height: 5),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 0),
                padding: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(45),
                        topLeft: Radius.circular(45))),
                //height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        const Text(
                          "Scan Ticket",
                          style: kBlackHeadingSize,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 45,
                          width: 130,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kGreenMainTheme,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TicketDetails()));
                            },
                            child: SizedBox(
                              child: IconButton(
                                iconSize: 29,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TicketDetails()));
                                },
                                icon: const Icon(Icons.qr_code_scanner,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:busmate/Screens/ticket_details.dart';
import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:busmate/Controller/date_controller.dart';
import 'package:busmate/Controller/scanner_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  @override
  List _places = ['Aluva', 'Vyttila'];
  final dateController = Get.put(DateController());
  final scannerController = Get.put(ScannerController());


  // Extract the values from the arguments map

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;
    final name = arguments?['Name'] as String?;
    final id = arguments?['id'] as String?;
    final route = arguments?['Route'] as String?;
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
                                    Obx(() => Text(
                                          DateFormat('dd-MMM-yyyy').format(
                                              Get.find<DateController>()
                                                  .currentDate
                                                  .value),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFE4E4E4)),
                                        )),
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
                                      "Conductor ID: ${id}",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Name: ${name}",
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
                              child:  Text(
                                "BUS ROUTE :",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.grey[300],
                                    fontWeight: FontWeight.w500),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white,width: 2)),
                              child: Center(child: Text('$route',style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),))
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
                              scannerController.ScanQr();
                            },
                            child: SizedBox(
                              child: Icon(Icons.qr_code_scanner),
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

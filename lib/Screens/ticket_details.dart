import 'package:busmate/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketDetails extends StatelessWidget {
  late final String route = "vytilla";
  late final String stop = "kaloor";
  late final int days_remain = 3;
  var issueDate = "12-Jun-23";
  var expiryDate = "12-Jun-23";
  final String docId = Get.arguments ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenMainTheme,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: kGreenMainTheme,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: const Text(
                          "Ticket Details",
                          style: kWhiteHeadingSize,
                        )),
                    Container(),
                  ],
                )),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Center(
                child: Container(
                  // color: Colors.white,
                  margin: const EdgeInsets.all(34),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kGreyTextColor.withOpacity(1),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: Container(
                          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "#ID$docId",
                        style: kGreyTextTicketStyle,
                      ),
                      const SizedBox(height: 40),
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Route: ",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              " $route",
                              style: kBlackTicketTextSize,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Stop: ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              " $stop",
                              style: kBlackTicketTextSize,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Days Remaining: ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              " $days_remain",
                              style: kBlackTicketTextSize,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Issue Date: ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              " ${issueDate}",
                              style: kBlackTicketTextSize,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Expiry Date: ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '${expiryDate}',
                              style: kBlackTicketTextSize,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Status", style: kGreyTextTicketStyle),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Active",
                                style: TextStyle(
                                    color: kStatusColor,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                    ],
                  ))),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 40),
          ),
          Expanded(
            flex: 1,
            child: FractionallySizedBox(
              heightFactor: 1.3,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(45),
                        topLeft: Radius.circular(45))),
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(
                                          width: 1, color: kGreenMainTheme))),
                              fixedSize: MaterialStateProperty.all(
                                  const Size(100, 50))),
                          child: const Text("Home",
                              style: TextStyle(
                                  color: kGreyTextColor, fontSize: 18))),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kGreenMainTheme),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: const BorderSide(
                                        width: 1, color: kGreenMainTheme))),
                            fixedSize:
                                MaterialStateProperty.all(const Size(110, 50))),
                        onPressed: () {},
                        label: const Text(
                          'Next',
                          style: TextStyle(fontSize: 17),
                        ),
                        icon: Container(
                          width: 33,
                          height: 35,
                          child: Image.asset(
                            'assets/images/scan_icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

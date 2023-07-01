import "package:busmate/Constants/constants.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/services.dart";
import "package:flutter_barcode_scanner/flutter_barcode_scanner.dart";
import "package:get/get.dart";
import 'package:busmate/Screens/ticket_details.dart';
import 'package:busmate/Screens/conductor_home.dart';

class ScannerController extends GetxController {
  String scannedQrcode = "";
  late String stop;
  late String expiryDate;
  late String issueDate;
  late String route;
  late int count;
  late int remainingRides;

  Future<void> readDocumentFields(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Tickets')
          .doc(documentId)
          .get();

      if (documentSnapshot.exists) {
        // Extract fields from the document
        stop = documentSnapshot.get('Destination');
        expiryDate = documentSnapshot.get('ExpiryDate');
        issueDate = documentSnapshot.get('IssueDate');
        route = documentSnapshot.get('Route');
        count = documentSnapshot.get('count');
        remainingRides = count - 1;
        Get.to(() => TicketDetails(
              route: route,
              expiryDate: expiryDate,
              issueDate: issueDate,
              remainingRides: remainingRides,
              stop: stop,
              ticketId: documentId,
            ));
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error reading document: $e');
      Get.offAll(() => HomePage());
    }
  }

  Future<void> ScanQr() async {
    try {
      scannedQrcode = await FlutterBarcodeScanner.scanBarcode(
          "#37c976", "Cancel", true, ScanMode.QR);
      if (scannedQrcode != "-1") {
        Get.snackbar("QR READED", scannedQrcode);
        readDocumentFields(scannedQrcode);
      }
    } on PlatformException {
      Get.snackbar("Error", "Something Went Wrong");
    }
  }
}

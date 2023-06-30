import "package:busmate/Constants/constants.dart";
import "package:flutter/services.dart";
import "package:flutter_barcode_scanner/flutter_barcode_scanner.dart";
import "package:get/get.dart";
import 'package:busmate/Screens/ticket_details.dart';

class ScannerController extends GetxController {
  String scannedQrcode = "";

  Future<void> ScanQr() async {
    try {
      scannedQrcode = await FlutterBarcodeScanner.scanBarcode(
          "#37c976", "Cancel", true, ScanMode.QR);
      if (scannedQrcode != -1) {
        Get.to(() => TicketDetails(), arguments: {scannedQrcode});
      }
    } on PlatformException {
      Get.snackbar("Error", "Something Went Wrong");
    }
  }
}

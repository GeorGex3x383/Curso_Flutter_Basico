import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus_outlined),
      onPressed: ()async{
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#F90514', 'Cancelar', false, ScanMode.QR);
        //final barcodeScanRes = 'https://climate.nasa.gov/news/3068/nasa-data-power-new-usda-soil-moisture-portal/';
        //final barcodeScanRes = 'geo:19.351939,-99.175244';

        if(barcodeScanRes == '-1'){
          return;
        }
        
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        launchURL(context, nuevoScan);
      },
    );
  }
}
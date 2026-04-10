import 'Corelogic.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan QR Code")),
      body: MobileScanner(
        onDetect: (capture) async {
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            final String code = barcodes.first.rawValue ?? "";
            await QRService.saveToHistory(code); // [cite: 25]
            _showResultDialog(context, code);
          }
        },
      ),
    );
  }

  void _showResultDialog(BuildContext context, String code) {
    bool isUrl = Uri.tryParse(code)?.hasAbsolutePath ?? false;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Scan Result"),
        content: Text(code),
        actions: [
          if (isUrl)
            TextButton(
              onPressed: () => launchUrl(Uri.parse(code)), // [cite: 14, 36]
              child: Text("Open URL"),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }
}

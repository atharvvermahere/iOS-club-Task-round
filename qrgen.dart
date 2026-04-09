import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratorScreen extends StatefulWidget {
  @override
  _GeneratorScreenState createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generate QR")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Enter text/URL"),
              onChanged: (val) => setState(() => data = val),
            ),
            SizedBox(height: 20),
            if (data.isNotEmpty)
              QrImageView(
                data: data,
                version: QrVersions.auto,
                size: 200.0,
              ), // [cite: 17]
          ],
        ),
      ),
    );
  }
}
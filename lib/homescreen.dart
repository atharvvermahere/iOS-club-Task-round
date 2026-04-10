import 'package:flutter/material.dart';
import 'corelogic.dart';
import 'qrscan.dart';
import 'qrgen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  void _loadHistory() async {
    final history = await QRService.getHistory();
    setState(() => _history = history);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Utility")),
      body: Column(
        children: [
          // Action Buttons [cite: 8, 9]
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ScannerScreen()),
                ),
                child: Text("Scan QR"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => GeneratorScreen()),
                ),
                child: Text("Generate QR"),
              ),
            ],
          ),
          Divider(),
          Text(
            "Recent Scans",
            style: TextStyle(fontWeight: FontWeight.bold),
          ), // [cite: 10]
          Expanded(
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.history),
                title: Text(_history[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

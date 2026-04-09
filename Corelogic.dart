import 'package:shared_preferences/shared_preferences.dart';

class QRService {
  static const String _historyKey = 'scan_history';

  // Save scan result to local storage [cite: 25]
  static Future<void> saveToHistory(String value) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList(_historyKey) ?? [];
    
    // Add new scan to the top, avoid duplicates [cite: 32]
    history.remove(value); 
    history.insert(0, value);
    
    await prefs.setStringList(_historyKey, history);
  }

  // Retrieve history for the "Recent Scans" section [cite: 10]
  static Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_historyKey) ?? [];
  }
}
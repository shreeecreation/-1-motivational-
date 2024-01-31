import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PocketBaseClient {
  static const String _baseUrl = 'https://thank-rather.pockethost.io/';

  static PocketBaseClient? _instance;
  PocketBase? _pb;

  /// Private constructor for singleton pattern
  PocketBaseClient._();

  /// Create or get the single instance of [PocketBaseClient]
  factory PocketBaseClient() {
    _instance ??= PocketBaseClient._(); // Create instance if it doesn't exist
    return _instance!;
  }

  final Logger _logger = Logger('PocketBaseClient');

  /// Initialize [PocketBaseClient]
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _pb = PocketBase(
      _baseUrl,
      authStore: AsyncAuthStore(
        save: (data) => prefs.setString('pb_auth', data),
        initial: prefs.getString('pb_auth'),
      ),
    );
    _logger.info('Initialized PocketBaseClient');
  }

  /// Get the [PocketBase] client
  PocketBase get client {
    assert(
        _pb != null, 'PocketBase is not initialized. Call initialize() first.');
    return _pb!;
  }

  Future<void> saveUserData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('pb_auth', jsonEncode(data));
  }

  /// Check if PocketBase is initialized
  bool get isInitialized => _pb != null;
}

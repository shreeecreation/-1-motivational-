
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:motivational/bootstrap.dart';
import 'package:motivational/src/app/app.dart';

Future<void> main() async {
  // final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
  }
  await bootstrap(() => const App());
}

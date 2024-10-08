import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:motivational/firebase_options.dart';
import 'package:motivational/src/core/clients/pocket_base_client.dart';
import 'package:motivational/src/core/logigng.dart';

import 'src/features/notifications/notifications_service.dart';

class AppBlocObserver extends BlocObserver {
  @override
  Future<void> onChange(BlocBase<dynamic> bloc, Change<dynamic> change) async {
    super.onChange(bloc, change);
    logger.fine('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.fine('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await PocketBaseClient().initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initFirebaseMessaging();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: onDidReceiveLocalNotificationForeground,
    onDidReceiveBackgroundNotificationResponse: onDidReceiveLocalNotificationBackground,
  );
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    runApp(await builder());
  });
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });

  await _initDependencies();
  Bloc.observer = AppBlocObserver();

  Bloc.observer = AppBlocObserver();
  runApp(await builder());
}

Future<void> _initDependencies() async {
  // await Hive.initFlutter();
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

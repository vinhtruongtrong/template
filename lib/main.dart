import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/app/app.dart';
import 'package:template/core/src/widgets/keyboard_dismisser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase
  await Firebase.initializeApp();
  // Crashlytics
  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(kDebugMode);
  Function originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    originalOnError(errorDetails);
  };

  runZonedGuarded(() {
    runApp(
      const ProviderScope(
        child: KeyboardDismisser(
          child: App(),
        ),
      ),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
  // FirebaseCrashlytics.instance.crash();
}

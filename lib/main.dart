import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';

import './my_app.dart';

final sentry = SentryClient(
    dsn: "https://25be4c8b1f544f00b86a0dece4d85662@sentry.io/2211943");

bool get isInDebugMode {
  bool inDebugMode = false;

  assert(inDebugMode = true);

  return inDebugMode;
}

Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  print('Caught error: $error');

  if (isInDebugMode) {
    print(stackTrace);
    return;
  } else {
    sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );
  }
}

main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runZoned(
    () => runApp(MyApp()),
    onError: (Object error, StackTrace stackTrace) {
      _reportError(error, stackTrace);
    },
  );
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/app/app.dart';
import 'package:template/core/src/widgets/keyboard_dismisser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: KeyboardDismisser(
        child: App(),
      ),
    ),
  );
}

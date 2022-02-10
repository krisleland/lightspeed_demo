import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

class TypicodeApiHandler {
  TypicodeApiHandler._internal();

  factory TypicodeApiHandler() {
    if (!getIt.isRegistered<TypicodeApiHandler>()) {
      getIt.registerSingleton<TypicodeApiHandler>(TypicodeApiHandler._internal());
    }
    return getIt<TypicodeApiHandler>();
  }
}
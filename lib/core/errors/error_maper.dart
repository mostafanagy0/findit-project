import 'dart:async';
import 'dart:io';

import 'package:findit/core/errors/app_failure.dart';

class ErrorMapper {
  static AppFailure map(dynamic error) {
    if (error is TimeoutException) {
      return NetworkFailure("Connection timed out. Please try again.");
    } else if (error is SocketException) {
      return NetworkFailure("No internet connection.");
    }

    return UnknownFailure("Something went wrong.");
  }
}

/*
 *Technical Programming III Assignment
 * S Nkosi
 * Route Page
 */

import 'package:flutter/material.dart';
import 'package:flutter_units_app/views/pages/main_sheet.dart';
import 'package:flutter_units_app/views/pages/textfield_sheet.dart';

class RouteManager {
  static const String firstsheet = '/';
  static const String secondsheet = '/secondsheet';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstsheet:
        return MaterialPageRoute(
          builder: (context) => const FirstSheet(),
        );

      case secondsheet:
        return MaterialPageRoute(
          builder: (context) => const SecondSheet(),
        );

      default:
        throw Exception('Error: The Is No Such Page');
    }
  }
}

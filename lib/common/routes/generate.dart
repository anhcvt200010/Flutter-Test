import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_test/common/routes/slide_right_route.dart';

import '../../pages/login/view.dart';
import '../../pages/shared/shared.dart';
import '../../pages/sign_up/view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/register':
      return SlideRightRoute(widget: const SignUpPage());
    case '/login':
      return SlideRightRoute(widget: const LoginPage());
    default:
      return SlideRightRoute(widget: const NotFoundPage());
  }
}
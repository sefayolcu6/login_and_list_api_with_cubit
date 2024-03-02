import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';

Future flushbarWidget(
    BuildContext context, String title, String message, Duration duration) {
  return Flushbar(
    title: title,
    message: message,
    duration: duration,
  ).show(context);
}

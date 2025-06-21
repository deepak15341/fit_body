import 'package:fitbody/app/utils/widgets/snack_bar/custom_snack_bar.dart';
import 'package:fitbody/app/utils/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/material.dart';

void showSnack({required BuildContext context, required MessageType messageType}) {
  final overlay = Overlay.of(context);

  switch (messageType.type) {
    case 'success':
      showTopSnackBar(
        overlay,
        CustomSnackBar.success(message: messageType.message),
      );
      break;
    case 'error':
      showTopSnackBar(
        overlay,
        CustomSnackBar.error(message: messageType.message),
      );
      break;
    case 'info':
    default:
      showTopSnackBar(
        overlay,
        CustomSnackBar.info(message: messageType.message),
      );
      break;
  }
}


class MessageType {
  final String message;
  final String type;

  const MessageType._(this.message, this.type);

  factory MessageType.success(String message) =>
      MessageType._(message, 'success');

  factory MessageType.error(String message) =>
      MessageType._(message, 'error');

  factory MessageType.info(String message) =>
      MessageType._(message, 'info');
}

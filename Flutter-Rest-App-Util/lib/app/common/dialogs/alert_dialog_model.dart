import 'package:flutter/material.dart';
import 'package:sharada_app/app/common/components/widgets/common_button.dart';

@immutable
class AlertDialogModel<T> {
  final String title;
  final String message;
  final Map<String, T> buttons;

  const AlertDialogModel({
    required this.title,
    required this.message,
    required this.buttons,
  });
}

extension Present<T> on AlertDialogModel<T> {
  Future<T?> present(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title),
              const SizedBox(height: 16.0),
              if (message.isNotEmpty)
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (message.isNotEmpty) const SizedBox(height: 14.0),
              Column(
                children: buttons.entries.map((entry) {
                  return CommonButton(
                      onPress: () {
                        Navigator.of(context).pop(entry.value);
                      },
                      buttonTitle: entry.key);
                }).toList(),
              )
            ],
          ),
          // actions: buttons.entries.map((entry) {
          //   return TextButton(
          //       onPressed: () {
          //         Navigator.of(context).pop(entry.value);
          //       },
          //       child: Text(entry.key));
          // }).toList(),
        );
      },
    );
  }
}

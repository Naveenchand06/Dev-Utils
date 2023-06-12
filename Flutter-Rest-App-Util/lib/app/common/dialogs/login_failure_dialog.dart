import 'package:flutter/foundation.dart';
import 'package:sharada_app/app/common/dialogs/alert_dialog_model.dart';
import 'package:sharada_app/utils/constants/strings.dart';

@immutable
class LoginFailureDialog extends AlertDialogModel<bool> {
  const LoginFailureDialog()
      : super(
          message: 'Something went wrong',
          title: 'Invalid Credentials',
          buttons: const {
            Strings.ok: false,
          },
        );
}

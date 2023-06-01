import 'package:flutter/foundation.dart';

@immutable
class Constants {
  static const accountExistsWithDifferentCredential =
      'account-exists-with-different-credential';
  static const googleCom = 'google.com';
  static const emailScope = 'email';

  /// private constructor so it cannot be initialized from the outside world
  const Constants._();
}

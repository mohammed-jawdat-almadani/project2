import 'package:flutter_test/flutter_test.dart';
import 'package:home_maintenance/core/localization/app_strings.dart';

void main() {
  test('AppStrings localization contains essential OTP keys', () {
    expect(AppStrings.get('otp_verification', 'ar'), 'تأكيد رمز التحقق');
    expect(AppStrings.get('otp_verification', 'en'), 'OTP Verification');
    expect(AppStrings.get('otp_sent_sms_desc', 'ar'), isNotEmpty);
    expect(AppStrings.get('otp_sent_sms_desc', 'en'), isNotEmpty);
  });
}

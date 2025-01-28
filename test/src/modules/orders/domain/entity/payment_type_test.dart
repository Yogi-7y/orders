import 'package:flutter_test/flutter_test.dart';
import 'package:tamara_assignment/src/modules/orders/domain/entity/payment_type.dart';

void main() {
  group('PaymentProductType', () {
    test('SplitInNType should display correct text', () {
      const systemUnderTest = SplitInNType(
        totalInstallments: 3,
        currentInstallment: 1,
      );

      expect(systemUnderTest.displayText, 'Split in 3');
    });

    test('PayNextMonthType should display correct text', () {
      const systemUnderTest = PayNextMonthType();

      expect(systemUnderTest.displayText, 'Pay Next Month');
    });

    test('PayInFullType should display correct text', () {
      const systemUnderTest = PayInFullType();

      expect(systemUnderTest.displayText, 'Pay Later in 30 days');
    });
  });
}

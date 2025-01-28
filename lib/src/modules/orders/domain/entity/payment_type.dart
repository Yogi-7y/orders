import 'package:meta/meta.dart';

@immutable
sealed class PaymentProductType {
  const PaymentProductType();

  /// Formatted text to display to the user.
  String get displayText;
}

@immutable
final class SplitInNType implements PaymentProductType {
  const SplitInNType({
    required this.totalInstallments,
    required this.currentInstallment,
  });

  final int totalInstallments;
  final int currentInstallment;

  @override
  String get displayText => 'Split in $totalInstallments';

  @override
  String toString() =>
      'SplitInNType(totalInstallments: $totalInstallments, currentInstallment: $currentInstallment)';

  @override
  bool operator ==(covariant SplitInNType other) {
    if (identical(this, other)) return true;

    return other.totalInstallments == totalInstallments &&
        other.currentInstallment == currentInstallment;
  }

  @override
  int get hashCode => totalInstallments.hashCode ^ currentInstallment.hashCode;
}

@immutable
final class PayNextMonthType implements PaymentProductType {
  const PayNextMonthType();

  @override
  String get displayText => 'Pay Next Month';

  @override
  String toString() => 'PayNextMonthType()';

  @override
  bool operator ==(covariant PayNextMonthType other) => true;

  @override
  int get hashCode => 0;
}

@immutable
final class PayInFullType implements PaymentProductType {
  const PayInFullType();

  @override
  String get displayText => 'Pay Later in 30 days';

  @override
  String toString() => 'PayInFullType()';

  @override
  bool operator ==(covariant PayInFullType other) => true;

  @override
  int get hashCode => 0;
}

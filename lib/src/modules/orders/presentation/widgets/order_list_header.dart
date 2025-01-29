import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/typography/typography.dart';

@immutable
class OrdersHeader extends ConsumerWidget {
  const OrdersHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fonts = ref.watch(fontsProvider);

    final currentFormattedDate = DateFormat('MMMM yyyy').format(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: kToolbarHeight + 20),
        Text('Recent orders', style: fonts.heading2),
        const SizedBox(height: 12),
        Text(currentFormattedDate, style: fonts.label2),
        const SizedBox(height: 12),
      ],
    );
  }
}

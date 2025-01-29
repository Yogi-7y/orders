import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors/theme.dart';
import '../../../../core/theme/typography/typography.dart';
import '../state/orders_provider.dart';

class OrderListItem extends ConsumerWidget {
  const OrderListItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(fontsProvider);
    final order = ref.watch(scopedOrderProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _ProductLeadingImage(),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.merchant.name,
                style: font.label1,
              ),
              const SizedBox(height: 4),
              Text(
                order.paymentProductType.displayText,
                style: font.caption1,
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${order.amount.currency} ${order.amount.value}',
                style: font.label2,
              ),
              Text(
                order.status.displayText,
                style: font.caption1.copyWith(color: const Color(0xff966F22)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ProductLeadingImage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(scopedOrderProvider);
    final theme = ref.watch(themeProvider);

    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: order.merchant.logo,
        fit: BoxFit.cover,
        placeholder: (context, url) => ColoredBox(color: theme.neutral200),
        errorWidget: (context, url, error) => ColoredBox(
          color: theme.neutral200,
          child: Icon(
            Icons.error,
            size: 20,
            color: theme.textSecondary.withValues(alpha: .6),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors/theme.dart';
import '../../../../core/theme/typography/typography.dart';
import '../state/orders_provider.dart';
import '../widgets/order_list_header.dart';
import '../widgets/order_list_item.dart';

class OrderListScreen extends ConsumerWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: theme.surface0,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: OrdersHeader()),
            _OrderListSection(),
          ],
        ),
      ),
    );
  }
}

class _OrderListSection extends ConsumerWidget {
  const _OrderListSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersProvider);

    return orders.when(
      data: (orders) => SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: orders.length,
          (context, index) => ProviderScope(
            overrides: [
              scopedOrderProvider.overrideWithValue(orders[index]),
            ],
            child: const OrderListItem(),
          ),
        ),
      ),
      error: (error, stack) => SliverToBoxAdapter(
        child: Text(error.toString()),
      ),
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

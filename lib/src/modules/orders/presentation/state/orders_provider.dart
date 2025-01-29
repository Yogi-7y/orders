import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/order.dart';
import '../../domain/use_case/order_use_case.dart';

final ordersProvider = FutureProvider<List<Order>>((ref) async {
  final useCase = ref.watch(orderUseCaseProvider);

  final orders = await useCase.getOrders();

  return orders.fold(
    onSuccess: (orders) => orders,
    onFailure: (failure) => throw failure,
  );
});

/// Must be overridden by the SliverList at runtime.
final scopedOrderProvider = Provider<Order>((ref) => throw UnimplementedError());

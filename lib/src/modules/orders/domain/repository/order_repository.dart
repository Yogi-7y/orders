import 'package:core_y/core_y.dart';

import '../entity/order.dart';

typedef Orders = List<Order>;
typedef AsyncOrders = Future<Result<Orders, AppException>>;

/// Contract via which we talk with the outside world.
///
/// Should be implemented by the data layer.
abstract class OrderRepository {
  /// Fetches all orders from the data source.
  ///
  /// Returns a [Result] containing either:
  /// - A [List<Order>] on success
  /// - An [AppException] on failure
  AsyncOrders getOrders();
}

import 'package:meta/meta.dart';
import 'package:network_y/network_y.dart';

import '../../../../core/extensions/list_extension.dart';
import '../../../../core/validators/serialization_validator.dart';
import '../../domain/repository/order_repository.dart';
import '../models/order_model.dart';
import '../requests/fetch_orders_request.dart';

@immutable
abstract class OrderRemoteDataSource {
  Future<Orders> getOrders();
}

@immutable
class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  const OrderRemoteDataSourceImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<Orders> getOrders() async {
    final result = await apiClient<Map<String, Object?>>(GetOrdersRequest());

    return result.fold(
      onSuccess: (map) {
        final validator = FieldTypeValidator(map, StackTrace.current);

        final ordersWithCount = validator.isOfType<Map<String, Object?>>('orders');

        final orders = ordersWithCount['items'] as List<Object?>? ?? [];

        final orderModels = orders.tryMap(OrderModel.fromMap);

        return orderModels;
      },
      onFailure: (error) {
        throw error;
      },
    );
  }
}

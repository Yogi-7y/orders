import '../../domain/repository/order_repository.dart';
import '../data_sources/remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl({required this.remoteDataSource});

  final OrderRemoteDataSource remoteDataSource;

  @override
  AsyncOrders getOrders() {
    throw UnimplementedError();
  }
}

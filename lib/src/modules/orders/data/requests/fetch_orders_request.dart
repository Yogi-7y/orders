import 'package:meta/meta.dart';

import '../../../../core/constants/api.dart';
import '../../../../core/network/api_client.dart';

@immutable
class GetOrdersRequest extends BaseApiRequest {
  GetOrdersRequest({super.endpoint = Api.orders});
}

import 'package:arshad_dev/apiservice/dio_api.dart';
import 'package:arshad_dev/baseclass/basecontroller.dart';
import 'package:arshad_dev/locale/locale_service.dart';
import 'package:arshad_dev/utils/constants.dart';
import 'package:get/get.dart';

class BaseBinding extends Bindings {
  final String type;

  BaseBinding(this.type);

  @override
  void dependencies() {
    switch (type) {
      case Constants.initialRouting:
        _initialRoutingDependencies();
        break;

      default:
        throw Exception('Unknown route: $type');
    }
  }

  void _initialRoutingDependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<LocaleService>(() => LocaleService());
    Get.put(DioApi(), permanent: true);
  }
}

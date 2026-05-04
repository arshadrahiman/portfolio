import 'package:arshad_dev/apiservice/dio_api.dart';
import 'package:arshad_dev/baseclass/basecontroller.dart';
import 'package:arshad_dev/utils/constants.dart';
import 'package:arshad_dev/module/contact/controller/contact_controller.dart';
import 'package:arshad_dev/module/portfolio/controller/portfolio_controller.dart';
import 'package:arshad_dev/module/projects/controller/project_section_controller.dart';
import 'package:arshad_dev/module/skills/controller/service_controller.dart';
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
    Get.put(DioApi(), permanent: true);

    // Feature controllers
    Get.put<PortfolioController>(PortfolioController());
    Get.put<ServiceController>(ServiceController());
    Get.put<ProjectSectionController>(ProjectSectionController());
    Get.put<ContactController>(ContactController());
  }
}

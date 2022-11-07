import 'package:uppercut_fantube/presentation/screens/contentDetail/content_detail_scaffold_controller.dart';
import 'package:uppercut_fantube/utilities/index.dart';

abstract class PresentationModules {
  PresentationModules._();

  static void dependencies() {
    // 탭 스크린
    Get.lazyPut(() => TabsViewModel(), fenix: true);
    Get.lazyPut(() => HomeViewModel(), fenix: true);

    // 컨텐츠 상세화면
    Get.lazyPut(() => ContentDetailScaffoldController(), fenix: true);

  }
}
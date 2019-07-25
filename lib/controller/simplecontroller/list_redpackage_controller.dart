import 'package:rxdio/com/kukugtu/rxdio/NetCallBack.dart';
import 'package:rxdio/com/kukugtu/rxdio/rxdio.dart';
import 'package:rxstate/controller/base/base_controller.dart';

class ListRedpackageController extends BaseController<String> {
  ListRedpackageController(controller) : super(controller);

  void getRedPackage() {
    RxDio<String>()
      ..setBaseUrl("https://web.kukugtu.top/")
      ..setPath("KukugtuProject/redpackage/ListRedpackage_app.php")
      ..setMethord(REQUEST_METHORD.GET)
      ..setParams(null)
      ..setCacheMode(CacheMode.FIRST_CACHE_THEN_REQUEST)
      ..call(
        new NetCallback(
          onCacheFinish: (data) {
            controller.add(data);
          },
          onNetFinish: (data) {
            controller.add(data);
          },
          onUnkownFinish: (data) {},
        ),
      );
  }
}

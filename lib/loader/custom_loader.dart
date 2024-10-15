import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shopping_app/configs/color/colors.dart';

void showCustomLoader(String? msg) {
  EasyLoading.instance
    ..userInteractions = false
    ..loadingStyle = EasyLoadingStyle.custom
    ..textColor = AppColor.black
    ..indicatorSize = 45
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..indicatorColor = AppColor.black
    ..backgroundColor = AppColor.white;
  EasyLoading.show(
      status: msg ?? "",
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true);
}

void dismissCustomLoader() {
  if (EasyLoading.isShow) EasyLoading.dismiss();
}
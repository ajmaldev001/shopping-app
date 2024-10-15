import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/configs/color/colors.dart';
import 'package:shopping_app/configs/routes/route_generator.dart';
import 'package:shopping_app/view_model/home/products_view_model.dart';
import 'di/get_it.dart' as get_it;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(get_it.init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ProductsViewModel>(
              create: (context) => ProductsViewModel(),
            ),
          ],
          child: GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              cardColor: AppColor.white,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.white,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    appBarTheme: const AppBarTheme(elevation: 0),
            ),
            builder: EasyLoading.init(),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute 
          ),
        );
      }
    );
  }
}



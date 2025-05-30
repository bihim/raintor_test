import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:raintor_test/config/app_routes/app_route.dart';
import 'package:raintor_test/generated/assets.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.go(AppRoute.location);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                Assets.imagesLogo,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20.h,
              ),
              child: CircularProgressIndicator(
                strokeWidth: 4.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

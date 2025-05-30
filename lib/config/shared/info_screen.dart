import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.titleWidget,
    this.descriptionWidget,
    this.iconWidget,
  });

  final String? title;
  final String? description;
  final IconData? icon;
  final Widget? titleWidget;
  final Widget? descriptionWidget;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10.h,
                children: [
                  titleWidget ??
                      Text(
                        title ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.r,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  descriptionWidget ??
                      Text(
                        description ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.r,
                        ),
                      ),
                ],
              ),
              Gap(
                30.h,
              ),
              iconWidget ??
                  Icon(
                    icon ?? Icons.info,
                    size: 100.r,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

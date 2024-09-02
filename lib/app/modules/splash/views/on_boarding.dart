import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
class OnBoarding extends StatelessWidget {
  const OnBoarding({
    super.key,
    required this.title,
    required this.subtitle,
    //required this.image,
  });
  final String title,subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image(
          //     width: AppHelperFunction.screenHeight() * 0.8,
          //     height: AppHelperFunction.screenWidth() * 0.6,
          //     image: AssetImage(image)),
          // const SizedBox(height: AppSizes.spaceBtwItems),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:AppHelperFunction.screenWidth() * 0.1 ),
            child: Column(
              children: [
                Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(subtitle,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).disabledColor),textAlign: TextAlign.center,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
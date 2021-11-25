/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-08 11:17:34 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-08 11:35:24
 */
import 'package:flutter/material.dart';

class DefaultNetworkAware extends StatelessWidget {
  final bool isOffline;
  final AnimationController controller;
  final Animation<double> height;
  final Animation<Color?> color;

  DefaultNetworkAware({
    Key? key,
    required this.isOffline,
    required this.controller,
  })  : height = Tween<double>(begin: 0, end: 66).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.3,
              curve: Curves.fastLinearToSlowEaseIn,
            ),
          ),
        ),
        color = ColorTween(
          begin: Colors.green,
          end: Colors.black,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.3,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (isOffline) {
          controller.forward();
        } else {
          controller.reverse();
        }
        return Container(
          color: color.value,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
            top: 16,
          ),
          height: height.value,
          child: Text(
            isOffline ? 'No Internet Connection' : 'Back online',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.white),
          ),
        );
      },
    );
  }
}

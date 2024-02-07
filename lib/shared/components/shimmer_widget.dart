import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerLoadingScreen extends StatelessWidget {
  final Axis scrollDirection;
  final double? height;
  final double? width;
  const ShimmerLoadingScreen({
    Key? key,
    required this.scrollDirection,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height != null ? (height! + 4) : 160,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: scrollDirection,
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 12, left: 12),
            child: Container(
              width: width ?? 120.h,
              height: height ?? 160.w,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(0)),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.white,
                enabled: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 15.0,
                              color: Colors.grey[100]!,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 20.0,
                              color: Colors.grey[100]!,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 15.0,
                              color: Colors.grey[100]!,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 20.0,
                              color: Colors.grey[100]!,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          itemCount: 6,
        ));
  }
}

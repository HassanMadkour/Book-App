import 'package:flutter/material.dart';
import 'package:project/Features/home/presentation/view/widgets/loading_widgets/book_item_loading.dart';
import 'package:project/constants.dart';
import 'package:project/core/utils/styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSailerItemLoading extends StatelessWidget {
  const BestSailerItemLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const ShimmerEffect(baseColor: Colors.grey),
      enabled: true,
      child: SizedBox(
        height: kScreenHight * .15,
        child: Row(
          children: [
            const AspectRatio(
              aspectRatio: 1 / 1.5,
              child: BookItemLoading(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: SizedBox(
                width: kScreenWidth * .58,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Title of book written here",
                        style: TextStyles.textStyle18,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                      ),
                      Text(
                        "author of the book",
                        style: TextStyles.textStyle14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Free ",
                            style: TextStyles.textStyle16,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const Text("rating here")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

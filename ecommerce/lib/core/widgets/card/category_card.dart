import 'package:ecommerce/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

// ignore: must_be_immutable
class CategoryCardWidget extends StatefulWidget {
  String categoryName;
  CategoryCardWidget({super.key, required this.categoryName});

  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 1,
        child: Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            Center(
              child: Text(
                widget.categoryName.toCapitalized(),
                style: context.textTheme.headline6,
              ),
            ),
            const Spacer(
              flex: 7,
            ),
            Image.asset(ImageConstant.categoryImage1),
          ],
        ),
      ),
    );
  }
}

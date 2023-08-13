// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

// ignore: must_be_immutable
class ProductCardWidget extends ConsumerStatefulWidget {
  String imageUrl;
  String productName;
  double productPrice;
  String category;
  double rating;
  ProductCardWidget({
    required this.rating,
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.category,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductCardWidgetState();
}

class _ProductCardWidgetState extends ConsumerState<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RatingBar.builder(
                itemSize: 10,
                initialRating: widget.rating,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.productName,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.category,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.start,
                "${widget.productPrice.toString()} TL",
                style: context.textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

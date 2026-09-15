import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';
import 'package:more_devs_do_zero/features/home/widgets/product_detail_bottom_sheet.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Skeleton.replace(
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
          ),
          ),
        SizedBox(height: 8),
        Text(product.brand, style: AppTextStyle.smallGrey),
        Text(product.name, style: AppTextStyle.smallBlack),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return ProductDetailBottomSheet(
                  product: product,
                );
              },
            );
          },
          child: Text(
            '\$${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
            style: AppTextStyle.smallGreen,
          ),
        ),
      ],
    );
  }
}
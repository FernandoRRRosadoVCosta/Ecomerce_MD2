import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Widget;
import 'package:more_devs_do_zero/features/cart/cart_controller.dart'
    show CartController;
import 'package:more_devs_do_zero/features/home/models/product_model.dart';
import 'package:provider/provider.dart';

class ProductDetailsModal extends StatelessWidget {
  final Product product;

  const ProductDetailsModal({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        final cartItem = cartController.getCartItem(product);

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                product.brand,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 12),

              const Text(
                'Descrição do produto',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 4),

              const Text('Produto de excelente qualidade para você.'),

              const SizedBox(height: 12),

              Text(
                'R\$ ${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              if (cartItem == null)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      cartController.addProduct(product);
                    },
                    child: const Text('Adicionar no carrinho'),
                  ),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        cartController.decrement(product);
                      },
                      icon: const Icon(Icons.remove),
                    ),

                    Text(
                      '${cartItem.quantity}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        cartController.increment(product);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}

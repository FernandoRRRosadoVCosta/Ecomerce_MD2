import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/cart/cart_controller.dart'
    show CartController;
import 'package:more_devs_do_zero/features/cart/cart_item_widget.dart';
import 'package:more_devs_do_zero/features/cart/checkout_page.dart'
    show CheckoutPage;
import 'package:provider/provider.dart' show Consumer;

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const String route = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho'), centerTitle: true),
      body: Consumer<CartController>(
        builder: (context, cartController, child) {
          if (cartController.items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart_outlined, size: 80),

                    const SizedBox(height: 20),

                    const Text(
                      'Seu carrinho está vazio',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Adicione produtos ao carrinho para continuar.',
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/home',
                            (route) => false,
                          );
                        },
                        child: const Text('Continuar comprando'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  itemCount: cartController.items.length,
                  itemBuilder: (context, index) {
                    final item = cartController.items[index];

                    return CartItemWidget(item: item);
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'R\$ ${cartController.total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 120,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CheckoutPage.route);
                        },
                        child: const Text('Continuar'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

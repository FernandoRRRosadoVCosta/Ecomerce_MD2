import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';

class ProductDetailBottomSheet extends StatelessWidget {
  final Product product;

  const ProductDetailBottomSheet({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGEM
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                product.imageUrl,
                width: double.infinity,
                height: 210,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            // NOME DO PRODUTO
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            // MARCA
            Text(
              product.brand,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 8),

            // DESCRIÇÃO
            const Text(
              'A acerola é uma fruta tropical conhecida pelo seu sabor '
              'refrescante, levemente ácido e naturalmente adocicado. '
              'Rica em vitamina C e muito versátil, pode ser consumida '
              'in natura, utilizada em sucos, vitaminas, sobremesas e '
              'diversas receitas.',
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 4),
            const Text(
              'Ideal para quem busca uma opção saborosa e nutritiva '
              'para o dia a dia. Produto selecionado para garantir '
              'qualidade, frescor e sabor.',
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 12),

            // PREÇO
            Text(
              'R\$ ${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            // BOTÃO
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // futuramente adicionaremos ao carrinho
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Adicionar no carrinho',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
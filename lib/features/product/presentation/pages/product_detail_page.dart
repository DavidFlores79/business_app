import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatefulWidget {
  final String? productId; // 👈 Puede ser nulo

  const ProductDetailPage({super.key, this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    int maxLines = 3;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 🔝 AppBar con imagen colapsable
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: size.height * 0.5,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/cake.jpg', fit: BoxFit.cover),
                  Positioned(
                    top: 60,
                    left: 16,
                    child: _circleButton(
                      icon: Icons.arrow_back_ios_new,
                      onTap: () => context.pop(),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 16,
                    child: Row(
                      children: [
                        _circleButton(
                          icon: Icons.favorite_border,
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        _circleButton(icon: Icons.share, onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔽 Contenido scrollable
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Categoría + rating
                  Row(
                    children: [
                      const Text('Cake', style: TextStyle(fontSize: 16)),
                      const Spacer(),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      const Text('4.9', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      // Image.asset('assets/icons/flag_india.png', width: 24),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Chocolate Cake',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. Auctor non bibendum est eu. '
                    'Lorem ipsum dolor sit amet consectetur. Auctor non bibendum est eu. '
                    'Fusce tempor aliquet quis sed pharetra cras pharetra faucibus tellus',
                    style: const TextStyle(fontSize: 16),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      // horizontal: 20,
                      vertical: 16,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Total Cost',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$30.00',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_bag),
                          label: const Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF6C3D1C),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onTap,
    Color? bgColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor ?? const Color.fromARGB(255, 230, 191, 195),
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Icon(icon, size: 25),
      ),
    );
  }
}

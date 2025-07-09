import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String? productId; // 👈 Puede ser nulo

  const ProductDetailPage({super.key, this.productId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 🔝 AppBar con imagen colapsable
            SliverAppBar(
              pinned: true,
              expandedHeight: 300,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset('assets/images/cake.jpg', fit: BoxFit.cover),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: _circleButton(
                        icon: Icons.arrow_back_ios_new,
                        onTap: () {},
                      ),
                    ),
                    Positioned(
                      top: 16,
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
                    const SizedBox(height: 16),

                    // Vendedor
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                            'assets/images/woman.png',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Jenny',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Cook',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        _circleButton(
                          icon: Icons.chat_bubble_outline,
                          onTap: () {},
                          bgColor: Colors.orange.shade100,
                        ),
                        const SizedBox(width: 12),
                        _circleButton(
                          icon: Icons.phone_outlined,
                          onTap: () {},
                          bgColor: Colors.orange.shade100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Lorem ipsum dolor sit amet consectetur. Auctor non bibendum est eu. '
                      'Fusce tempor aliquet quis sed pharetra cras pharetra faucibus tellus',
                      style: TextStyle(fontSize: 16),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Read More'),
                    ),
                    const Divider(height: 32),
                    const SizedBox(
                      height: 100,
                    ), // Padding para evitar tapado por el footer
                    Container(
                      padding: const EdgeInsets.symmetric(
                        // horizontal: 20,
                        vertical: 16,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 8),
                        ],
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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}

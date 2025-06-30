import 'package:business_app/features/product/data/models/product_model.dart';
import 'package:business_app/features/product/domain/entities/product_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int _selectedIndex = 0; // Para el BottomNavigationBar

  // --- DATOS DE EJEMPLO (MOCK DATA) ---
  // Reemplaza esto con los datos de tu API/Bloc
  final List<CategoryModel> _categories = [
    CategoryModel(name: 'Cup Cake', icon: Icons.cake),
    CategoryModel(name: 'Cookies', icon: Icons.cookie),
    CategoryModel(name: 'Donuts', icon: Icons.donut_large),
    CategoryModel(name: 'Breads', icon: Icons.breakfast_dining),
  ];
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(LoadInitialProducts());

    _controller =
        ScrollController()..addListener(() {
          if (_controller.position.pixels >=
              _controller.position.maxScrollExtent - 200) {
            context.read<ProductBloc>().add(LoadMoreProducts());
          }
        });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else if (state is ProductLoaded) {
            return CustomScrollView(
              slivers: [
                _HomeHeader(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SectionHeader(title: 'Special Offers'),
                        const SizedBox(height: 10),
                        const SpecialOfferCard(),
                        const SizedBox(height: 10),
                        _SectionHeader(title: 'Categories'),
                        const SizedBox(height: 10),
                        CategoryList(categories: _categories),
                        const SizedBox(height: 10),
                        _SectionHeader(title: 'Featured Products'),
                        const SizedBox(height: 10),
                        ProductList(products: state.products),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}

// --- WIDGETS DESCOMPUESTOS ---

class _HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Usamos MediaQuery para obtener el padding superior (área del notch/isla dinámica)
    final topPadding = MediaQuery.of(context).padding.top;

    return SliverAppBar(
      pinned: true,
      floating: true,
      // Aumentamos la altura para dar más espacio a los elementos
      expandedHeight: 150.0,
      backgroundColor: const Color(
        0xFF4A4A4A,
      ), // Un gris oscuro como en la imagen
      automaticallyImplyLeading: false,

      // SOLUCIÓN 1: El título principal (Location) va aquí
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.location_on, color: Colors.white, size: 16),
              SizedBox(width: 4),
              Text(
                'New York, USA',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14, // Tamaño ajustado para claridad
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
            ],
          ),
        ],
      ),

      // SOLUCIÓN 3: Estilizamos las acciones para que coincidan con el diseño
      actions: [
        _buildActionIcon(Icons.shopping_cart_outlined),
        const SizedBox(width: 8),
        _buildActionIcon(Icons.notifications_outlined),
        const SizedBox(width: 8),
      ],

      // SOLUCIÓN 2: La barra de búsqueda ahora vive en el 'background' del FlexibleSpaceBar
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          // Padding para alinear la barra de búsqueda correctamente debajo del título y las acciones
          padding: EdgeInsets.only(
            top: topPadding + 56,
          ), // 56 es la altura estándar de un AppBar
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                        filled: true,
                        fillColor: Colors.white, // Fondo blanco para contraste
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Botón de filtro estilizado
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      // El icono 'tune' es más parecido al de la imagen
                      icon: const Icon(Icons.tune, color: Colors.black54),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para crear los iconos de acción y evitar repetir código
  Widget _buildActionIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: () {},
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'See All',
            style: TextStyle(
              color: Colors.amber[800],
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      height: 160,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        // Puedes agregar una imagen de fondo aquí
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Limited time!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          const Spacer(),
          const Text(
            'Get Special Offer',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Text('Up to', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              const Text(
                '40%',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Shop Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Asumo que tienes un modelo similar a este
class CategoryModel {
  final String? name;
  final IconData icon;

  CategoryModel({required this.name, required this.icon});
}

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      // 1. Envolver el ListView con un widget Center
      child: Center(
        child: ListView.builder(
          // 2. Agregar esta propiedad
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          // El padding ahora puede estar aquí o en el contenedor padre
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Padding(
              // Es mejor usar padding simétrico para un espaciado consistente
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center, // Centra el contenido de la columna
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      category.icon,
                      size: 30,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.name ?? 'No name',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        shadowColor: Colors.grey.withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: product.image,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity,
                    placeholder:
                        (context, url) => Container(
                          color: Colors.grey[300],
                          height: 150,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => Container(
                          color: Colors.grey[300],
                          height: 150,
                          child: const Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            product.rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      radius: 18,
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Colors.black54,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber[800],
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            // Acción al presionar el botón
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${product.name} added to cart'),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

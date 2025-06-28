// UI: store_page.dart (extracto con Bloc usage)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Store')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else if (state is ProductLoaded) {
            return ListView.builder(
              controller: _controller,
              itemCount: state.products.length + (state.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.products.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final product = state.products[index];
                return ListTile(
                  leading:
                      product.image != null
                          ? Image.network(product.image!, width: 60)
                          : null,
                  title: Text(product.name ?? 'No Name'),
                  subtitle: Text('\$${product.price?.toStringAsFixed(2)}'),
                  onTap: () {
                    // TODO: Navegar al detalle
                  },
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

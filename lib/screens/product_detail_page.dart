import 'package:flutter/material.dart';
import 'package:abibas_shoes/models/products.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Future<Products> fetchProductDetail(CookieRequest request) async {
    try {
      final response = await request.get('http://localhost:8000/json/${widget.productId}/');
      developer.log('Response received: $response');

      // Handle the response which comes as a List with one item
      if (response is List && response.isNotEmpty) {
        return Products.fromJson(response[0]);
      }
      
      throw Exception('Invalid response format');
    } catch (e) {
      developer.log('Error in fetchProductDetail: $e');
      throw Exception('Failed to load product: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder(
        future: fetchProductDetail(request),
        builder: (context, AsyncSnapshot<Products> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Error loading product',
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Details: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'Product not found',
                style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
              ),
            );
          }

          final product = snapshot.data!.fields;
          
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Price
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Price: \$${product.price}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Description
                    const Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 16),

                    // Type
                    if (product.type != null) ...[
                      const Text(
                        'Type:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.type!,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Materials
                    if (product.materials != null) ...[
                      const Text(
                        'Materials:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.materials!,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
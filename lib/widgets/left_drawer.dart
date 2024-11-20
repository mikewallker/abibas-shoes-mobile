import 'package:abibas_shoes/screens/list_products.dart';
import 'package:flutter/material.dart';
import 'package:abibas_shoes/screens/menu.dart';
import 'package:abibas_shoes/screens/product_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: const Column(
            children: [
              Text(
                'Abibas Shoes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                "Run Anywhere, Fun Everywhere",
                textAlign: TextAlign.center,  // Center alignment
                style: TextStyle(
                  fontSize: 15,              // Font size 15
                  color: Colors.white,       // White color
                  fontWeight: FontWeight.normal,  // Normal weight
                ),
              ),
            ],
          ),
          ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.production_quantity_limits_rounded),
              title: const Text('Tambah Item'),
              // Bagian redirection ke ProductFormPage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductFormPage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.production_quantity_limits),
              title: const Text('Daftar Produk'),
              onTap: () {
                  // Route menu ke halaman mood
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductsPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}
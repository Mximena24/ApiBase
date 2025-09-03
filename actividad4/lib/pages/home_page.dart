import 'package:actividad4/models/products.dart';
import 'package:actividad4/services/products_service.dart';
import 'package:actividad4/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   List<Products> _products = [];
  

  ListView _getProducts(){
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context ,index){
        final product = _products[index];
        return CardPrueba(product: product);
      });
  }


  void getProductos() async {
  final service = ProductsService();
  try {
    _products = await service.fetchProducts();
    _products.forEach((producto) {
      print('${producto.name} - \$${producto.price}');
    });
  } catch (e) {
    print("Error: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
       body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,            
          children: [
            Column(
            children: [
              Text("Nombre: ${user.name}"),
              ElevatedButton(
                child: const Text("Registro"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => registration_and_editing(product: product),
                    ),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: (null),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ));
    } 
  }
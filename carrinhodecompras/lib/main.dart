import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Produto {
  final String nome;
  final double preco;
  final String imagemUrl;

  Produto(this.nome, this.preco, this.imagemUrl);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrinho de Compras',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const TelaCarrinho(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({super.key});

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  double total = 0.0;

  final List<Produto> produtos = [
    Produto('Camiseta', 49.90, 'https://placehold.co/150x100/FF0000/FFFFFF/png'),
    Produto('Calça', 89.90, 'https://placehold.co/150x100/FFFF00/000000/png'),
    Produto('Tênis', 199.90, 'https://placehold.co/150x100/FFA500/FFFFFF/png'),
    Produto('Boné', 29.90, 'https://placehold.co/150x100/F5DEB3/000000/png'),
    Produto('Meias', 9.90, 'https://placehold.co/150x100/FFFFFF/000000/png'),
    Produto('Jaqueta', 149.90, 'https://placehold.co/150x100/6F4E37/FFFFFF/png'),
  ];

  void adicionarAoCarrinho(double preco) {
    setState(() {
      total += preco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Carrinho de Compras'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: produtos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final produto = produtos[index];
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(produto.imagemUrl, height: 80),
                          Text(
                            produto.nome,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
                          ElevatedButton(
                            onPressed: () => adicionarAoCarrinho(produto.preco),
                            child: const Text('Adicionar'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: Colors.teal.shade100,
              child: Text(
                'Total: R\$ ${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Billing System'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {



  void _incrementCounter(List<ProductObj> productList,int productNumber) {
    setState(() {
      productList[productNumber].count++;
    });
  }

  void _decrementCounter(List<ProductObj> productList,int productNumber) {
    setState(() {

      if(productList[productNumber].count > 0)
        {
          productList[productNumber].count--;
        }
      else{
        showDialog(
          context: context,
          builder: (BuildContext context)
            {
              return const AlertDialog(
                content: Text ('Zero se kabhi kam suna h')
              );
            }
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: productList.asMap().entries.map((entry) {
            final int index = entry.key;
            final ProductObj product = entry.value;
            print(product.name);
          return Column (
              children : <Widget> [
                ProductCounter(
                  productName: product.name,
                  count: product.count,
                  onIncrementPressed: () {
                    _incrementCounter(productList,index);
                  },
                  onDecrementPressed: () {
                    _decrementCounter(productList,index);
                  },
                ),
              const SizedBox(height: 16),
              ]);
            }).toList(),
        )

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hy');
        },
        tooltip: 'Save',
        child: const Text('Save'),
      ),
    );
  }
}

class ProductCounter extends StatelessWidget {
  final String productName;
  final int count;
  final VoidCallback onIncrementPressed;
  final VoidCallback onDecrementPressed;

  const ProductCounter({
    super.key,
    required this.productName,
    required this.count,
    required this.onIncrementPressed,
    required this.onDecrementPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          '$productName: ',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(height: 16,width: 10),
        Text(
          '$count',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
        // const SizedBox(height: 16,width: 10),

        ElevatedButton(
          onPressed: onIncrementPressed,
          child: const Text('+'),
        ),
        // const SizedBox(height: 16,width: 10),

        ElevatedButton(
          onPressed: onDecrementPressed,
          child: const Text('-'),
        ),
      ],
    );
  }
}



import 'package:billing_system/models/Sales.dart';
import 'package:flutter/material.dart';
import 'package:billing_system/Configs/product.dart';
import 'package:billing_system/components/ProductCounter.dart';
import 'package:mongo_dart/mongo_dart.dart' as Mongo;
import 'package:billing_system/dbHelper/MongoDatabase.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => HomePage();
}

class HomePage extends State<MyHomePage> {

  Future<void> _insertData(String productId,int quantity) async {
    var id = Mongo.ObjectId();
    final data = Sales(id: id.toString(), productId: productId, quantity: quantity);
    var result = await MongoDatabase.insert(data);
  }

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

          productList.forEach((product) {
            if (product.count > 0) {
            _insertData(product.name, product.count);
            setState(() {
              product.count = 0;
              });
            }
             });
        },
        tooltip: 'Save',
        child: const Text('Save'),
      ),
    );
  }
}

import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:billing_system/Environment.dart' as environment;
import '../models/Sales.dart';

class MongoDatabase{
  static var db,salesCollection;
  static connect() async {
    db = await Db.create(environment.MONGO_CONNECTION_URL);
    await db.open();
    inspect(db);
    salesCollection = db.collection(environment.SALES_COLLECTION);
  }

  static Future<void> insert(Sales data) async{
    try {
      var result = await salesCollection.insertOne(data.toJSON());

      if (result.isSuccess)
        {
          print("Successfully inserted sales data");
        }
      else{
        print("Something went wrong");
      }
    }
    catch (e)
    {
      print(e.toString());
    }
  }

}
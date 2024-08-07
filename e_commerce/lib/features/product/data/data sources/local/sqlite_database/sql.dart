
import 'package:sqflite/sqflite.dart';

import '../../../model/product_model.dart';


class LocalDatabase{
   
   static Future<Database>db() async{
     return openDatabase('products.db',
          version: 1,
          onCreate: (db, version) async{
            String query = 'CREATE TABLE products(id: TEXT PRIMARY KEY,name: TEXT,imageUrl: TEXT, description:TEXT,price:REAL ';
            db.execute(query);
          },
     
      );
   }

   

   Future<void>Insert(ProductModel productModel) async{
      final db = await LocalDatabase.db();

      String checkQuery = 'SELECT COUNT(*) FROM products WHERE id = ?';
      List<Map<String, dynamic>> countResult = await db.rawQuery(checkQuery, [productModel.id]);


      int insertedItem = await db.rawInsert(
      'INSERT INTO Test(id, name, imageUrl,description,price) VALUES(?, ?, ?,?,?)',
      [productModel.id, productModel.name, productModel.imageUrl,productModel.description,productModel.price],
      
      );

   }  
}
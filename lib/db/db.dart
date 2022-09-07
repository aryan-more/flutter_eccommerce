import 'package:flutter_eccommerce/controller/cart.dart';
import 'package:flutter_eccommerce/models/cart.dart';
import 'package:flutter_eccommerce/view/main_view/main_view.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  static late Database _database;
  static String cartTable = "Cart";

  static Future<void> init() async {
    String path = (await getApplicationDocumentsDirectory()).path;
    _database = await openDatabase("$path/db.sqlite");
    if (await tableDoesNotExist(cartTable)) {
      await _database.execute("""
        CREATE TABLE $cartTable(
            id TEXT PRIMARY KEY,
            quantity  INTEGER NOT NULL
        )
    """);
    }
    var rawdata = await _database.query(cartTable);

    Get.put(Cart(products: rawdata.map((map) => CartProduct.fromMap(map)).toList()), permanent: true);
    Get.off(() => MainView());
  }

  static Future<void> insert(CartProduct product) async {
    await _database.insert(cartTable, product.toMap());
  }

  static Future<void> update({required CartProduct product}) async {
    await _database.update(cartTable, product.toMap(), where: 'id = ${product.id}');
  }

  static Future<void> close() async {
    await _database.close();
  }

  static Future<void> delete(CartProduct product) async {
    await _database.delete(cartTable, where: 'id = ${product.id}');
  }

  static Future<bool> tableDoesNotExist(String table) async {
    var data = await _database.rawQuery("SELECT name FROM sqlite_master WHERE type='table' AND name='$table'");
    return data.isEmpty;
  }
}

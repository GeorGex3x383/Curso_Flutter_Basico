import 'dart:convert';
import 'dart:io';
import 'package:app_validacion_forms/src/preferncias_usuario/preferencias_usuario.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

import 'package:app_validacion_forms/src/models/producto_model.dart';

import 'package:http/http.dart' as http;

class ProductosProvider{

  final String _url = 'https://flutter-varios-b5895-default-rtdb.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<bool> crearProducto(ProductoModel producto) async{

    final url = '$_url/productos.json?auth=${_prefs.token}';
    //final url = Uri.https(_url, 'productos.json');

    final resp = await http.post(Uri.parse(url), body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;

  }

  Future<bool> editarProducto(ProductoModel producto) async{

    final url = '$_url/productos/${producto.id}.json?auth=${_prefs.token}';
    //final url = Uri.https(_url, 'productos.json');

    final resp = await http.put(Uri.parse(url), body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;

  }

  Future<List<ProductoModel>> cargarProductos() async{

    final url = '$_url/productos.json?auth=${_prefs.token}';
    final resp = await http.get(Uri.parse(url));

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = [];

    if(decodedData == null) return [];

    if(decodedData['error'] != null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;

      productos.add(prodTemp);
    });

    //print(productos);
    return productos;
  }

  Future<int> borrarProducto(String id) async{

    final url = '$_url/productos/$id.json?auth=${_prefs.token}';
    final resp = await http.delete(Uri.parse(url));

    print(resp.body);

    return 1;
  }

  Future<String> subirImagen(File imagen) async{

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dkjqvc9xa/image/upload?upload_preset=n1tuxzpv');
    final mimeType = mime(imagen.path).split('/');

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath('file', imagen.path, contentType: MediaType(mimeType[0], mimeType[1]));

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if(resp.statusCode != 200 && resp.statusCode != 201){
      print('Algo salio mal');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);

    return respData['secure_url'];

  }

}
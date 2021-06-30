import 'dart:io';


import 'package:app_validacion_forms/src/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:app_validacion_forms/src/utils/utils.dart' as utils;
import 'package:app_validacion_forms/src/models/producto_model.dart';

import 'package:image_picker/image_picker.dart';


class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  //final productoProvider = new ProductosProvider();
  
  ProductosBloc productosBloc;
  ProductoModel producto = new ProductoModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {

    productosBloc = Provider.productosBloc(context);

    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if(prodData != null){
      producto = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Productos'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_outlined),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: _tomarFoto,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget _crearNombre() {

   return TextFormField(
     initialValue: producto.titulo,
     textCapitalization: TextCapitalization.sentences,
     decoration: InputDecoration(
       labelText: 'Producto',
     ),
     onSaved: (value) => producto.titulo = value,
     validator: (value){
       if(value.length < 3){
         return 'Ingrese el nombre del producto';
       } else {
         return null;
       }
     },
   );

 }

 Widget _crearPrecio() {

   return TextFormField(
     initialValue: producto.valor.toString(),
     keyboardType: TextInputType.numberWithOptions(decimal: true),
     decoration: InputDecoration(
       labelText: 'Precio',
     ),
     onSaved: (value) => producto.valor = double.parse(value),
     validator: (value){
       
       if(utils.esNumero(value)){
         return null;
       } else {
         return 'Solo numeros';
       }

     },
   );

 }

 Widget _crearDisponible() {

   return SwitchListTile(
     value: producto.disponible,
     title: Text('Disponible'),
     activeColor: Colors.orangeAccent,
     activeTrackColor: Colors.orangeAccent,
     onChanged: (value) => setState((){
       producto.disponible = value;
     }),
   );

 }

 Widget _crearBoton() {

   return ElevatedButton.icon(
     style: ElevatedButton.styleFrom(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
       primary: Colors.orangeAccent,
     ),
     label: Text('Guardar', style: TextStyle(color: Colors.black)),
     icon: Icon(Icons.save_outlined, color: Colors.black),
     onPressed: (_guardando) ? null : _submit,
   );
 }

 void _submit() async{

   if(!formKey.currentState.validate()) return;

   formKey.currentState.save();

   _guardando = true;
   setState(() {});

   if(foto != null){
     producto.fotoUrl = await productosBloc.subirFoto(foto);
   }

   if(producto.id == null){
    productosBloc.agregarProducto(producto);
   }else {
    productosBloc.editarProducto(producto);
   }

   //_guardando = false;
   //setState(() {});
   mostrarSnackBar('Registro guardado');

   Navigator.pop(context);

 }

void mostrarSnackBar(String mensaje){

  final snackBar = SnackBar(
    content: Text(mensaje, style: TextStyle(color: Colors.black, fontSize: 20.0)),
    duration: Duration(milliseconds: 1500),
    backgroundColor: Colors.orangeAccent,
    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
    elevation: 10.0, 
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

  Widget _mostrarFoto() {
 
    if (producto.fotoUrl != null) {
 
      return FadeInImage(
        image: NetworkImage(producto.fotoUrl),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );
 
    } else {
 
      if( foto != null ){
        return Image.file(
          foto,
          fit: BoxFit.cover,
          height: 300.0,
        );
      }
      return Image.asset('assets/no-image.png');
    }
  }

  Future _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  Future _tomarFoto() async{
    _procesarImagen(ImageSource.camera);
  }

  Future _procesarImagen(ImageSource origen) async{

    final _picker = ImagePicker();
    final pickedFile = await _picker.getImage(
      source: origen,
    );
    foto = File(pickedFile.path);
    if (foto != null) {
      producto.fotoUrl = null;
    }
    setState(() {});
  }

}
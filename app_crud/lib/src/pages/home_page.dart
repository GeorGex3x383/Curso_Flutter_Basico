import 'package:app_validacion_forms/src/bloc/provider.dart';
import 'package:app_validacion_forms/src/models/producto_model.dart';
import 'package:flutter/material.dart';
//import 'package:app_validacion_forms/src/bloc/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {

    //final bloc = Provider.of(context);
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado( ProductosBloc productosBloc ) {

    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
        if(snapshot.hasData){

          final productos = snapshot.data;

          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) => _crearItem(context, productosBloc, productos[i]),
          );

        } else {
          return Center(child: CircularProgressIndicator(backgroundColor: Colors.orangeAccent));
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductosBloc productosBloc, ProductoModel producto){

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion){
        //productosProvider.borrarProducto(producto.id);
        productosBloc.borrarProducto(producto.id);
      },
      child: Card(
        child: Column(
          children: [
            (producto.fotoUrl == null ) 
            ? Image(image: AssetImage('assets/no-image.png')) 
            : FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(producto.fotoUrl),
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
            ListTile(
              title: Text('${ producto.titulo } - ${ producto.valor }'),
              subtitle: Text(producto.id),
              onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto).then((value) => setState((){})),
            ),
          ],
        ),
      ),
    );
    //ListTile(
    //    title: Text('${ producto.titulo } - ${ producto.valor }'),
    //    subtitle: Text(producto.id),
    //    onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto).then((value) => setState((){})),
    //  ),

  }

 _crearBoton(BuildContext context) {

   return FloatingActionButton(
     backgroundColor: Colors.orangeAccent,
     child: Icon(Icons.add_circle_outline_rounded, color: Colors.black),
     onPressed: () => Navigator.pushNamed(context, 'producto').then((value) => setState((){})),
   );

 }
}
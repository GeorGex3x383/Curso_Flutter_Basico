import 'package:app_validacion_forms/src/providers/usuario_provider.dart';
import 'package:app_validacion_forms/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:app_validacion_forms/src/bloc/provider.dart';

class RegistroPage extends StatelessWidget {

  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

 Widget _crearFondo(BuildContext context) {

   final size = MediaQuery.of(context).size;

   final fondoApp = Container(
     height: size.height * 0.4,
     width: double.infinity,
     decoration: BoxDecoration(
       gradient: LinearGradient(
         colors: <Color>[
          Color.fromRGBO(254, 140, 11, 1.0),
          Color.fromRGBO(255, 164, 61, 1.0)
         ]
       ),
     ),
   );

   final circulo = Container(
     width: 100.0,
     height: 100.0,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(100.0),
       color: Colors.white24
     ),
   );

   final logo = Container(
     padding: EdgeInsets.only(top: 80.0),
     child: Column(
       children: [
         Icon(Icons.person_pin_circle_outlined, color: Colors.white, size: 100.0),
         SizedBox(height: 10.0, width: double.infinity,),
         Text('Georgie App Create Account', style: TextStyle(color: Colors.white, fontSize: 25.0))

       ],
     ),
   );

   return Stack(
     children: [
       fondoApp,
       Positioned( top: 90.0, left: -10.0, child: circulo ),
       Positioned( top: -40.0, right: -30.0, child: circulo ),
       Positioned( bottom: -50.0, right: -30.0, child: circulo ),
       Positioned( bottom: -40.0, left: 80.0, child: circulo ),
       Positioned( top: 50.0, left: 180.0, child: circulo ),
       logo,
     ],
   );
 }

 Widget _loginForm(BuildContext context) {

   final bloc = Provider.of(context);
   final size = MediaQuery.of(context).size;

   return SingleChildScrollView(
     child: Column(
       children: [
         SafeArea(
           child: Container(
             height: 200.0,
           ),
         ),
         Container(
           width: size.width * 0.85,
           margin: EdgeInsets.symmetric(vertical: 30.0),
           padding: EdgeInsets.symmetric(vertical: 50.0),
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(8.0),
             boxShadow: <BoxShadow>[
               BoxShadow(
                 color: Colors.black26,
                 blurRadius: 3.0,
                 offset: Offset(0.0, 5.0),
                 spreadRadius: 3.0
               )
             ]
           ),
           child: Column(
             children: [
               Text('Crear cuenta', style: TextStyle(fontSize: 20.0)),
               SizedBox(height: 60.0),
               _crearEmail(bloc),
               SizedBox(height: 20.0),
               _crearPassword(bloc),
               SizedBox(height: 30.0),
               _crearBoton(bloc),
             ],
           ),
         ),
         TextButton(
           child: Text('??Ya tienes cuenta? Login'),
           onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
         ),
         SizedBox(height: 100.0),
       ],
     ),
   );

 }

 Widget _crearEmail(LoginBloc bloc) {

   return StreamBuilder(
     stream: bloc.emailStream,
     builder: (BuildContext context, AsyncSnapshot snapshot){
       return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.alternate_email, color: Colors.orangeAccent),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo Electronico',
            counterText: snapshot.data,
            errorText: snapshot.error
          ),
          onChanged: bloc.changeEmail,
        ),
      );
     },
   );
 }

  Widget _crearPassword(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock_outline_rounded, color: Colors.orangeAccent),
            labelText: 'Contrase??a',
            counterText: snapshot.data,
            errorText: snapshot.error
          ),
          onChanged: bloc.changePassword,
        ),
      );
    },
  );
 }

 Widget _crearBoton(LoginBloc bloc) {

   return StreamBuilder(
     stream: bloc.formValidStream,
     builder: (BuildContext context, AsyncSnapshot snapshot){
       return ElevatedButton(
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar'),
      ),
      style: ElevatedButton.styleFrom(
      primary: Colors.orangeAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
     ),
     onPressed: snapshot.hasData ? ()=> _register(context, bloc) : null,
    );
   },
  );
 }

  _register(BuildContext context, LoginBloc bloc) async{

    final info = await usuarioProvider.nuevoUsuario(bloc.email, bloc.password);

    if(info['ok']){
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      mostrarAlerta(context, info['mensaje']);
    }
    
    //Navigator.pushReplacementNamed(context, 'home');
  }

}
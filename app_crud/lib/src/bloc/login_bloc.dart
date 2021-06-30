import 'dart:async';

import 'package:app_validacion_forms/src/bloc/validators.dart';

import 'package:rxdart/rxdart.dart';



class LoginBloc with Validators{

  //final _emailController    = StreamController<String>.broadcast();
  //final _passwordController = StreamController<String>.broadcast();
  //Este cambio se hace ya que no sirve el stream controller para el metodo que usaremos de combinacion de streams
  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos del stream
  Stream<String> get emailStream    => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream  => Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //Insertar valores al stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener el ultimo valor ingresado a los streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }

}
import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFecha = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children:<Widget> [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Aquí sólo va el nombre',
        suffixIcon: Icon(Icons.person, color: Colors.lightBlue),
        icon: Icon(Icons.account_box_sharp, color: Colors.lightBlue),
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
        //print(_nombre);
      },
    );
  }

  Widget _crearEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Correo Electrónico',
        labelText: 'E-mail',
        helperText: 'Aquí ingrese su correo electrónico',
        suffixIcon: Icon(Icons.alternate_email, color: Colors.lightBlue),
        icon: Icon(Icons.email, color: Colors.lightBlue),
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
        //print(_nombre);
      },
    );
  }

  Widget _crearPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        helperText: 'Aquí ingrese su contraseña',
        suffixIcon: Icon(Icons.lock_outline, color: Colors.lightBlue),
        icon: Icon(Icons.lock, color: Colors.lightBlue),
      ),
      onChanged: (valor){
        setState(() {
          _password = valor;
        });
        //print(_nombre);
      },
    );
  }

  Widget _crearFecha( BuildContext context ){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFecha,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today, color: Colors.lightBlue),
        icon: Icon(Icons.perm_contact_calendar, color: Colors.lightBlue),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );
    if (picked != null){
      setState(() {
        _fecha = picked.toString();
        _inputFecha.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){

    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) { 
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropdown(){

    return Row(
      children:<Widget> [
        Icon(Icons.play_for_work_rounded, color: Colors.lightBlue),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt){
            setState(() {
              _opcionSeleccionada = opt;
            });
          },
        )
      ],
    );
    
    
  }

  Widget _crearPersona(){
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('El email registrado es: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }
}
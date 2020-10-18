import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

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

  _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0),
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05), //0.05
      ),
    );
    return Container(
      height: size.height * 0.4,
      child: Stack(
        children: [
          fondoMorado,
          Positioned(top: 90.0, left: 30.0, child: circulo),
          Positioned(top: -40.0, right: -30.0, child: circulo),
          Positioned(bottom: -40.0, right: -10.0, child: circulo),
          Positioned(bottom: 120.0, right: 20.0, child: circulo),
          Positioned(bottom: -50.0, left: -20.0, child: circulo),
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Icon(Icons.person_pin_circle, size: 90.0, color: Colors.white),
                SizedBox(height: 10.0, width: double.infinity),
                Text(
                  "Danilo Sanchez",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(height: 180.0),
          ),
          Container(
            width: size.width * 0.80,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: [
                Text(
                  "Ingreso",
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 60.0),
                _crearEmail(bloc),
                SizedBox(height: 30.0),
                _crearPass(bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc)
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Text("Olvido la contraseña"),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.deepPurple,
                ),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electronico',
                counterText: snapshot.data,
                errorText: snapshot.error,
              ),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }

  _crearPass(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passStream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.deepPurple,
                ),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error,
              ),
              onChanged: bloc.changePassword,
            ),
          );
        });
  }

  _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.formValidateStream,
        builder: (context, snapshot) {
          return RaisedButton(
            onPressed: (snapshot.hasData) ? () => _login(context, bloc) : null,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text("Ingresar"),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 0.0,
            color: Colors.deepPurple,
            textColor: Colors.white,
          );
        });
  }

  _login(BuildContext context, LoginBloc bloc) {
    print("===============");
    print("Correo: ${bloc.email}");
    print("Password: ${bloc.pass} ");
    print("===============");

    Navigator.pushReplacementNamed(context, 'home');
  }
}

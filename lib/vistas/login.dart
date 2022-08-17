import 'package:flutter/material.dart';
import 'package:vildermontalvan/vistas/palabras_app.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final email = TextEditingController();
  final clave = TextEditingController();
  String emailText = '';
  String passwordText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Image.asset(
                'assets/imgs/Fondo.jpg',
                height: 250.0,
              ),
            ),
            Column(
              children: [
                Text('Generador de Palabras',
                    style: Theme.of(context).textTheme.headline1),
                Text('Inicie para continuar',
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'ejemplo@email.co',
                      labelText: 'Correo Electrónico',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    controller: clave,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Clave de 8 dígitos',
                      labelText: 'Contraseña',
                    ),
                  ),
                ),
              ],
            ),
            MaterialButton(
              elevation: 10.0,
              minWidth: 300.0,
              height: 50.0,
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Text('Ingresar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              onPressed: () {
                emailText = email.text;
                passwordText = clave.text;
                if (emailText == 'admin' && passwordText == '12345678') {
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return const ParPalabras();
                  }));
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Usuario o contraseña incorrectos'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const [
                              Text('Verifica tus datos'),
                            ],
                          ),
                        ),
                        actions: [
                          MaterialButton(
                              child: const Text('Aceptar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      );
                    },
                  );
                }
              },
            ),
            _registerButton(),
          ],
        ),
      ),
    );
  }
}

// Widget _userTextField() {
//   return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 35.0),
//       child: TextField(
//         keyboardType: TextInputType.emailAddress,
//         decoration: const InputDecoration(
//           icon: Icon(Icons.email),
//           hintText: 'ejemplo@email.co',
//           labelText: 'Correo Electrónico',
//         ),
//         onChanged: (value) {},
//       ),
//     );
//   });
// }

// Widget _passwordTextField() {
//   return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 35.0),
//       child: TextField(
//         keyboardType: TextInputType.text,
//         obscureText: true,
//         decoration: const InputDecoration(
//           icon: Icon(Icons.lock),
//           hintText: 'Clave de 8 dígitos',
//           labelText: 'Contraseña',
//         ),
//         onChanged: (value) {},
//       ),
//     );
//   });
// }

// Widget _loginButton() {
//   return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
//     return MaterialButton(
//       elevation: 10.0,
//       minWidth: 300.0,
//       height: 50.0,
//       color: Theme.of(context).accentColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
//       child: const Text('Ingresar',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//           )),
//       onPressed: () {},
//     );
//   });
// }

Widget _registerButton() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return MaterialButton(
      minWidth: 250.0,
      child: Row(
        children: [
          Icon(
            Icons.person_add,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            ' No tengo una cuenta y deseo registrarme',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      onPressed: () {},
    );
  });
}

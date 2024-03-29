import 'package:flutter/material.dart';
import 'package:login/sign_in_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.white,
          ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page(){
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height:50.0),
            _inputField("Usuario", usernameController),
            const SizedBox(height:30.0),
            _inputField("Contraseña", passwordController, isPassword: true),
            const SizedBox(height:50.0),
            _signInButton(),
            const SizedBox(height:30.0),
            _passText(),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
  return Container(
    decoration: BoxDecoration (
      border: Border.all(color:Colors.black, width: 2),
      shape: BoxShape.circle),
      child: const Icon( Icons.person,
        color: Colors.black, 
        size: 120.0,
      ),
    );
  }

// Widgets de Usuario y contraseña
  Widget _inputField(
    String hintText, TextEditingController controller,
    {isPassword = false} ){
      var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: const BorderSide(color: Colors.black)
      );
      return TextField(
        style: const TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: border,
          focusedBorder: border
        ),
        obscureText: isPassword,
      );
    }

// Botón de inicio de sesión
    Widget _signInButton() {
      return ElevatedButton(
        // Mostrar datos en debug console
        onPressed: (){
          debugPrint("Usuario: " + usernameController.text);
          debugPrint("Contraseña: " + passwordController.text);

          final route2 = MaterialPageRoute(builder: (context){
                  return const SignIn();
                });
                Navigator.push(context, route2);
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blue,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0)

        ), 
        child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Iniciar sesión", 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0 ),
        )),
      );
    }

  Widget _passText() {
    return const Text(
      "¿Has olvidado la contraseña?",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.black
        ),
      );
  }
}
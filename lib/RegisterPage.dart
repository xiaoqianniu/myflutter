import 'package:flutter/material.dart';
import 'package:myflutter/MainLayout.dart';
import 'package:provider/provider.dart';

import 'UserPage.dart';
import 'model/ProfileRepository.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // Text editing controllers
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _imageUrlController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Register",
      child: Column(
        children:<Widget> [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Username',
            ),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              filled: true,
              labelText: 'confirm Password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 12.0),TextField(
            controller: _imageUrlController,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Image URL',
            ),
          ),
          SizedBox(height: 12.0),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  _usernameController.clear();
                  _emailController.clear();
                  _passwordController.clear();
                  _confirmPasswordController.clear();
                  _imageUrlController.clear();
                },
              ),
              ElevatedButton(
                child: const Text('NEXT'),
                onPressed: () {
                  Provider.of<ProfileRepository>(context, listen: false)
                      .addUser(username:_usernameController.text, email:_emailController.text, password: _passwordController.text.trim(), confirmPassword:_confirmPasswordController.text,
                      image:_imageUrlController.text
                  );
                  Navigator.pop(context);
                },
              ),

            ],
          ),

        ],
      ),
    );
  }
}

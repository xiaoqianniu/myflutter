import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/AboutUs.dart';
import 'package:myflutter/ContactUs.dart';
import 'package:myflutter/RegisterPage.dart';
import 'package:myflutter/firebase_options.dart';
import 'package:myflutter/model/TempRepository.dart';
import 'package:myflutter/model/ProfileRepository.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'NavBar.dart';
import 'UserPage.dart';
import 'UsersPage.dart';
import 'model/AuthRepository.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthRepository authRepository = AuthRepository();
    return
      MultiProvider(
        providers: [
        // ChangeNotifierProvider(create: (context) => ProfileRepository()),
          Provider<AuthRepository>(
            create: (_) => authRepository,
          ),
          StreamProvider(
            create: (context) => context.read<AuthRepository>().authState, initialData: null,
          ),
          ChangeNotifierProvider(create: (context) => ProfileRepository(authRepository)),
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes:{
        'Home':(BuildContext context) => const MyHomePage(title:"xiaowei"),
        'ContactUs': (BuildContext context) => const ContactUs(),
        'AboutUs': (BuildContext context) => const AboutUs(),
        'RegisterPage':(BuildContext context) => const RegisterPage(),
        'UserPage':(BuildContext context) => const UserPage(),
        "Users":(BuildContext context) => const UsersPage(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page____xiaowei'),
    )

    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const NavBar(),
          Expanded(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: (){
              Navigator.pushNamed(context, 'RegisterPage');
            },
                child: const Text("Register")),

            TextButton(onPressed: (){
              Navigator.pushNamed(context, 'UserPage');
            },
                child: const Text("User")),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, 'Users');

            },
                child: const Text("Users")),
            // TextButton(onPressed: (){
            //  TempRepository().readData();
            //
            // },
            //     child: const Text("Read data")),
            // TextButton(onPressed: (){
            //   TempRepository().writeData();
            //
            // },
            // child: const Text("Get data")),

            // TextButton(onPressed: (){
            //   Provider.of<UserRepository>(context, listen:false).writeData();
            // },
            //     child: const Text("Add data")),

            // TextButton(onPressed: (){
            //   Provider.of<UserRepository>(context, listen:false).deleteData();
            // },
            //     child: const Text("delete data")),

            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
    )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

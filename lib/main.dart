import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "/ui_layer/map.dart";
import "/ui_layer/authentication.dart";
import "/data_layer/database.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<Database>(
        future: Database.open(),
        builder: (BuildContext context, AsyncSnapshot<Database> snapshot) {
          if (snapshot.hasData) {
            Database db = snapshot.data!;

            return Provider(
              create: (_) => db,
              child: const Center(
                child: Column(
                  children: <Widget>[
                    GoogleSignInButton(),
                    SizedBox(
                      height: 600,
                      child: InteractiveMap(),
                    )
                  ],
                )
              )
            );
          } else {
            return const SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            );
          }
        }
      )
    );
  }
}

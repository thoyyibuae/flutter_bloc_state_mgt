import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_trial/routes/route_generator.dart';
import 'package:flutter_bloc_trial/utils/palette.dart';

import 'bloc/cart_bloc.dart';
import 'bloc/product_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => ProductBloc()..add(GetProductList())),
        BlocProvider(
            create: (context) => CartBloc()..add(LoadProductCounter())),
      ],

      child: MaterialApp(
        title: 'Shopping',
        theme: ThemeData.light(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Palette.pageColor,
                  Palette.primaryColor,
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "BLISS",
                      style: TextStyle(
                          color: Palette.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

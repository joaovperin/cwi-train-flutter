import 'dart:async';

import 'package:dogs_list/commons/colors.dart';
import 'package:dogs_list/domain/dog.dart';
import 'package:dogs_list/domain/dog_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dogs',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: AppColors.transparent,
          elevation: 0,
        ),
        backgroundColor: AppColors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AppColors.green,
          ),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController<DogModel?> _stream = StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    _refreshDogs();
  }

  void _refreshDogs() {
    _stream.add(null);
    DogRepository.instance.getRandomDog().then((dog) {
      _stream.add(dog);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<DogModel?>(
                      stream: _stream.stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final dog = snapshot.data!;
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 40,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(dog.image),
                            ),
                          ),
                        );
                      }),
                ),
                StreamBuilder<DogModel?>(
                    stream: _stream.stream,
                    builder: (context, snapshot) {
                      final dogName = snapshot.data?.breed ?? 'Loading dog...';
                      return SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            dogName,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      );
                    }),
              ],
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                child: const Text('Refresh'),
                onPressed: _refreshDogs,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:exam_4/screens/models/api.dart';
import 'package:exam_4/screens/models/user_model.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.center,
          'Todo List Exam',
          style: TextStyle(
            color: Colors.purple,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: GetApi().getApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('oops');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snapshot.data![index].id.toString(),
                                style: TextStyle(
                                    color: snapshot.data![index].completed
                                        ? Colors.green
                                        : Colors.red),
                              ),
                              Text(
                                snapshot.data![index].title,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: snapshot.data![index].completed
                                        ? Colors.green
                                        : Colors.red),
                              ),
                              Text(
                                snapshot.data![index].completed.toString(),
                                style: TextStyle(
                                  color: snapshot.data![index].completed
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              )
                            ]),
                      ),
                    ),
                    key: ValueKey<UserModel>(snapshot.data![index]),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

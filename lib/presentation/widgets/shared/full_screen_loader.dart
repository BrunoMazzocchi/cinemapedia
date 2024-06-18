import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = ['Loading', 'Loading.', 'Loading..', 'Loading...'];

    return Stream.periodic(const Duration(seconds: 1), (x) => messages[x % messages.length]);
  }

  @override
  Widget build(BuildContext context) {



    return  Center(
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const CircularProgressIndicator(),
           const SizedBox(height: 16),
          
           StreamBuilder(
              stream: getLoadingMessages(),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? '');
              },
           ), 
        ],
      ),
    );
  }
}
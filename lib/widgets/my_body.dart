// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class myBody extends StatelessWidget {
  const myBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder<Map<String, dynamic>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final data = snapshot.data!;
                final question = data['question'];
                final solution = data['solution'];

                return Column(
                  children: <Widget>[
                    Image.network(question),
                    Text('Solution: $solution'),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(
    Uri.parse("http://marcconrad.com/uob/tomato/api.php?out=json&base64=no"),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}



// class myBody extends StatelessWidget {
//   final Function(Map<String, dynamic>) onDataFetched;

//   const myBody({
//     super.key,
//     required this.onDataFetched,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           FutureBuilder<Map<String, dynamic>>(
//             future: fetchData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else {
//                 final data = snapshot.data!;
//                 final question = data['question'];
//                 final solution = data['solution'];

//                 // Call the callback function to pass data to myHomePage.dart
//                 onDataFetched(data);

//                 return Column(
//                   children: <Widget>[
//                     Image.network(question),
//                     Text('Solution: $solution'),
//                   ],
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// Future<Map<String, dynamic>> fetchData() async {
//   final response = await http.get(
//     Uri.parse("http://marcconrad.com/uob/tomato/api.php?out=json&base64=no"),
//   );

//   if (response.statusCode == 200) {
//     final Map<String, dynamic> data = json.decode(response.body);
//     return data;
//   } else {
//     throw Exception('Failed to load data');
//   }
// }

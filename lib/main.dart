import 'package:flutter/material.dart';
import 'package:quotes/quote.dart';

void main() {
  return runApp(
    MaterialApp(
      home: quotesApp(),
    ),
  );
}

class quotesApp extends StatefulWidget {
  const quotesApp({Key? key}) : super(key: key);

  @override
  State<quotesApp> createState() => _quotesAppState();
}

List<Quote> quotesList = [
  Quote('Marcus Aurelius',
      '“You have power over your mind - not outside events. Realize this, and you will find strength.”'),
  Quote('Epictetus',
      '"If you want to improve, be content to be thought foolish and stupid."'),
  Quote('James Allen',
      '"Men are anxious to improve their circumstances, but are unwilling to improve themselves; they therefore remain bound."'),
  Quote('Aristotle', '“Knowing yourself is the beginning of all wisdom.”'),
  Quote('Socretes', '“The only true wisdom is in knowing you know nothing.”'),
];

class _quotesAppState extends State<quotesApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Quotes App'),
        backgroundColor: Colors.grey[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              quotesList[0].quoteText,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Divider(
            height: 20.0,
            color: Colors.grey[600],
            thickness: 1.0,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.arrow_right
            //size: 20.0,
            //color: Colors.grey[600],
            ),
        backgroundColor: Colors.grey[600],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StateTeksUtama extends State<TeksUtama> {
  var listNama = [
    'Lukman',
    'Adi',
    'Nur',
    'Hakim',
    'Nurul',
    'Huda',
    'Lendis',
    'Fabri'
  ];
  var listWarna = [
    Color.fromARGB(255, 78, 220, 12),
    Colors.purple,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.deepPurple,
    Colors.cyan,
    Colors.blue,
    Colors.yellow
  ];
  int index = 0;

  void incrementIndex() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.cyan[50],
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            offset: Offset(35.0, 30.0),
            blurRadius: 5,
          )
        ],
        border: Border.all(
          color: Colors.blue,
          width: 5,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Apa kabar',
            textDirection: TextDirection.ltr,
          ),
          Text(
            listNama[index % listNama.length],
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: listWarna[index % listWarna.length],
            ),
          ),
        ],
      ),
    );
  }
}

class TeksUtama extends StatefulWidget {
  @override
  StateTeksUtama createState() => StateTeksUtama();
}

void main() {
  runApp(
    MaterialApp(
      title: 'Halo Dunia',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halo Dunia'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TeksUtama(),
            ],
          ),
        ),
        floatingActionButton: IncrementButton(),
      ),
    ),
  );
}

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Random',
      child: Icon(Icons.refresh),
      onPressed: () {
        // Access the State object using the global key
        (context.findAncestorStateOfType<StateTeksUtama>())?.incrementIndex();
      },
    );
  }
}

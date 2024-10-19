import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejemplo de Scroll',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplos de Scroll')),
      body: ListView(
        children: [
          ListTile(
            title: Text('SingleChildScrollView'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SingleChildScrollViewExample()),
            ),
          ),
          ListTile(
            title: Text('ListView Scroll'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListViewExample()),
            ),
          ),
          ListTile(
            title: Text('GridView Scroll'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GridViewExample()),
            ),
          ),
          ListTile(
            title: Text('ScrollController Example'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScrollControllerExample()),
            ),
          ),
        ],
      ),
    );
  }
}

class SingleChildScrollViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SingleChildScrollView')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: List.generate(20, (index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(20),
                color: Colors.blueAccent,
                child: Text(
                  'Item $index',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            })),
      ),
    );

  }
}

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Scroll')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Elemento $index'),
          );
        },
      ),
    );
  }
}

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView Scroll')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        children: List.generate(20, (index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ScrollControllerExample extends StatefulWidget {
  @override
  _ScrollControllerExampleState createState() => _ScrollControllerExampleState();
}

class _ScrollControllerExampleState extends State<ScrollControllerExample> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print('Top of list');
        } else {
          print('End of list');
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ScrollController')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Item $index'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(seconds: 2),
            curve: Curves.easeOut,
          );
        },
        child: Icon(Icons.arrow_downward),
      ),
    );
  }
}

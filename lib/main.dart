import 'package:flutter/material.dart';
import 'dart:developer' as developer;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ToDoListPage(),
    );
  }
}

class ToDoListPage extends StatefulWidget {

  @override
  _ToDoListState createState() {
    return _ToDoListState();
  }
}

class _ToDoListState extends State<ToDoListPage> {

  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("リスト一覧")
      ),
      body: ListView.builder(
        itemCount: todoList.length,
          itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(todoList[index]),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final newListText = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return ToDoAddPage();
                })
            );
            developer.log("text=$newListText");
            if (newListText != null) {
              setState(() {
                todoList.add(newListText);
              });
            }
          },
          child: Icon(Icons.add)
      ),
    );
  }
}

class ToDoAddPage extends StatefulWidget {
  @override
  _ToDoAddPageState createState() {
    return _ToDoAddPageState();
  }
}

class _ToDoAddPageState extends State<ToDoAddPage> {

  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("リスト追加"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _text,
                  style: TextStyle(
                    color: Colors.red,
                  )
                ),
                TextField(
                  onChanged: (String value) {
                    setState(() {
                      _text = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(_text);
                      },
                      child: Text("追加")
                  ),
                ),
                Container(
                    width: double.infinity,
                    child:TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("キャンセル")
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final listItems = [
    'item 1',
    'item 2',
    'item 3',
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget> [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ]
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: ListView.builder(
                        itemCount: listItems.length,
                        itemBuilder: (context, index) {
                          return Text(listItems[index]);
                        }),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("row1"),
                        const Text("row2"),
                        TextButton(
                            onPressed: () {
                              //do something
                            },
                            style: TextButton.styleFrom(primary: Colors.red),
                            child: const Text("text button")),
                        OutlinedButton(
                          onPressed: () {},
                          style:
                          OutlinedButton.styleFrom(primary: Colors.green),
                          child: const Text("outlined button"),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.yellow, elevation: 20),
                            child: const Text("Elevated button")),
                      ]),
                  const Text("text"),
                  const TextButton(onPressed: null, child: Text("disabled")),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up),
                    color: Colors.pink,
                    iconSize: 64,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up),
                      label: const Text("good")),
                  OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                      label: const Text("Like")),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.flight),
                      label: const Text("flight"))
                ]),

            ListTile(
              leading: Image.network("https://placehold.jp/50x50.png"),
              title: Text("list tile"),
              subtitle: Text("sub title"),
              trailing: Icon(Icons.more_vert),
            ),
            Card(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text("card")
                )
            ),
            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: listItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          child: ListTile(
                            leading: Image.network("https://placehold.jp/50x50.png"),
                            title: Text(listItems[index]),
                            subtitle: Text("sub"),
                            trailing: Icon(Icons.favorite),
                          ),
                        )
                    );
                  }),
            ),

            const Text(
              'You have pushed the button this many times:',
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            const Text('bold', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Italic',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 36,
                    color: Colors.blue)),
            Container(
                width: double.infinity,
                color: Colors.amberAccent,
                child: const Text('align', textAlign: TextAlign.end)),
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://placehold.jp/200x100.png"))),
              child: const Text("image"),
            ),
            Container(
                width: 200,
                height: 30,
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(4),
                color: Colors.green,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: const Text("box"))),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.red,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

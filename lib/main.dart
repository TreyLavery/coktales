import 'package:flutter/material.dart';
import "dart:math";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: MyHomePage(title: 'coktales'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('coktales'),
      ),
      body: MyCustomForm(),
      // Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Invoke "debug painting" (press "p" in the console, choose the
      //     // "Toggle Debug Paint" action from the Flutter Inspector in Android
      //     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      //     // to see the wireframe for each widget.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  final liquorController = TextEditingController();
  List<String> liquors = [];
  final mixerController = TextEditingController();
  List<String> mixers = [];
  final syrupController = TextEditingController();
  List<String> syrups = [];
  final wildController = TextEditingController();
  List<String> wilds = [];
  final garnishController = TextEditingController();
  List<String> garnishes = [];

  final addButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Colors.green,
    padding: new EdgeInsets.all(15)
  );

  Widget generateList(context, list){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index){
          return Padding(padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(list[index]));
        }
    );
  }

  Widget generateSection(context, name, controller, list){
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(child:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              onSubmitted: (value){
                setState(() {
                  list.add(controller.text);
                });
                controller.clear();
              },
              controller: controller,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: name,
              ),
            ),
          )
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: new TextButton(
                  style: addButtonStyle,
                  onPressed: () {
                    setState(() {
                      list.add(controller.text);
                      //liquors = liquors.add(Text(liquorController.text));
                    });
                    controller.clear();
                  },
                  child: const Text('ADD'))
          ),
        ]
    );
  }

  generateDrink(){
    final _random = new Random();
    List drink = [];
    drink.add(liquors[_random.nextInt(liquors.length)]);
    drink.add(mixers[_random.nextInt(mixers.length)]);
    drink.add(syrups[_random.nextInt(syrups.length)]);
    drink.add(wilds[_random.nextInt(wilds.length)]);
    drink.add(garnishes[_random.nextInt(garnishes.length)]);
    return drink;
  }


  @override
  void dispose() {
    liquorController.dispose();
    mixerController.dispose();
    syrupController.dispose();
    wildController.dispose();
    garnishController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        generateSection(context, 'Add Liquors', liquorController, liquors),
        generateList(context,liquors),
        generateSection(context, 'Add mixers', mixerController, mixers),
        generateList(context,mixers),
        generateSection(context, 'Add syrup/Juices', syrupController, syrups),
        generateList(context,syrups),
        generateSection(context, 'Add wild card items', wildController, wilds),
        generateList(context,wilds),
        generateSection(context, 'Add garnish', garnishController, garnishes),
        generateList(context,garnishes),
        Center(
          child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blueAccent,
                padding: new EdgeInsets.all(15),
                textStyle: TextStyle(fontSize: 30),
                ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(generateDrink().toString()),
                     );
                   }
                  );
                },
              child: const Text('Generate'))
        ),
        Center(
          child: TextButton(
              style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.redAccent,
                        padding: new EdgeInsets.all(15),
                        textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  liquors.clear();
                  mixers.clear();
                  garnishes.clear();
                  syrups.clear();
                  wilds.clear();
                });
              },
              child: const Text('Clear All'),

            )
        )
      ],
    )
    );
  }
}

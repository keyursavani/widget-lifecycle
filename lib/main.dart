import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



void main() {
  runApp( MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.teal
    ),
    home: LifeCycleExm(),
  ));
}

class LifeCycleExm extends StatefulWidget {
  LifeCycleExm({Key? key}) :super(key:key){
    Fluttertoast.showToast(
        msg:"Frome Constructore",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white
    );
    print("Frome Constructore");
  }


  @override
  State<LifeCycleExm> createState() {
    Fluttertoast.showToast(
        msg:"Frome Create State",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white
    );
    print("Frome Create State");
    return _LifeCycleExmState();
  }
}

class _LifeCycleExmState extends State<LifeCycleExm> with WidgetsBindingObserver {
late AppLifecycleState _appLifecycleState;

@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Fluttertoast.showToast(
        msg:'initState',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white
    );
     print("initState");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _appLifecycleState = state;
      print('$_appLifecycleState');
      Fluttertoast.showToast(
          msg: '$_appLifecycleState',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white
      );
    });
    // super.didChangeAppLifecycleState(state);
    // print('AppLifecycleState: $state');
  }
   @override
  void didUpdateWidget(covariant LifeCycleExm oldWidget){
  super.didUpdateWidget(oldWidget);
  Fluttertoast.showToast(
      msg:'Update Widget',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white
  );
  }

  @override
  void dispose() {
    WidgetsBinding.instance .removeObserver(this);
    Fluttertoast.showToast(
        msg:'dispose',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white
    );
    print("dispose");
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print("deactivate");
    Fluttertoast.showToast(
        msg:'deactivate',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white
    );
    super.deactivate();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    Fluttertoast.showToast(
        msg:'build',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white
    );
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Widget Lifecycle")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 8.0,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
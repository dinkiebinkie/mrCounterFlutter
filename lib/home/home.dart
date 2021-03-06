import 'package:flutter/material.dart';
import '../app_state.dart';
import 'package:provider/provider.dart';
import 'home_counter_cont.dart';
import '../counters/counters.dart';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;
import 'dart:async';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//  String _latestHardwareButtonEvent;
//
//  StreamSubscription<HardwareButtons.VolumeButtonEvent> _volumeButtonSubscription;
//
//  @override
//  void initState() {
//    super.initState();
//    _volumeButtonSubscription = HardwareButtons.volumeButtonEvents.listen((event) {
//      String volumePressed = event.toString();
//
//      if (volumePressed == 'VolumeButtonEvent.VOLUME_UP') {
//        AppState.updateCount
//      } (volumePressed == 'VolumeButtonEvent.VOLUME_DOWN') {
//
//      }
//
//      setState(() {
//        _latestHardwareButtonEvent = event.toString();
//      });
//    });
//  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Mr. Counter"), actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {
                    print('open settings');
                  })
            ]),
            body: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              color: Colors.grey[200],
              child: Column(children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: appState.counters
                        .map((counter) => HomeCounterCont(
                      counter: counter,
                    ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                            onPressed: () {
                              appState.numberOfSelected > 0 ? Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Counters()),
                              ) : null;
                            },
                            color: appState.numberOfSelected > 0 ? Colors.blue[300] : Colors.grey[400],
                            materialTapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // removes default container padding at bottom...?!
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Go".toUpperCase(),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(Icons.arrow_forward, size: 20)
                              ],
                            )),
                      ),
                    ],
                  ),
                )
              ]),
            )));
  }
}

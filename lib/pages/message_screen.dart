import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/src/channel.dart';
import 'package:flutterwhatsapp/globals.dart' as globals;


class MessageScreen extends StatefulWidget {
  final WebSocketChannel channel;

  MessageScreen(this.channel);

  @override
  MessageScreenState createState() {
    return new MessageScreenState();
  }
}

class MessageScreenState extends State<MessageScreen> {
  String destination;

  @override
  void initState() {
    super.initState();

    print(globals.clients);
    destination = "none";
    if (globals.clients != null && globals.clients.length > 0) {
      if(globals.selected_client == null) {
        globals.selected_client = 0;
      }

      destination = globals.clients[globals.selected_client];
    }
    // set clients on the state
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: new Text(
            "Address: " + globals.address + " \r\n "
            "BIP39: " + globals.bip39,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}

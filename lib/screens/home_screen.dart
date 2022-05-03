

import 'package:flash_light_flutter/screens/body.dart';
import 'package:flutter/material.dart';

  class HomeScreen extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FlashLightFlutter",style: TextStyle(color: Colors.white),),
      ),
      body: new Body(),
    );
  }

  }



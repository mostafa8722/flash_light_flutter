
  import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';


class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>BodyState();
}
 class BodyState extends State<Body> {
  String img = "assets/images/torch_off.png";
  bool state = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Center(
          child: new Container(
            height: size.height - 100,
            width: size.width,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  if(state) {
                    img = "assets/images/torch_off.png";
                    _disableTorch(context);
                  }else {
                    img = "assets/images/torch_on.png";
                    _enableTorch(context);
                  }

                  state = !state;

                });
              },
              child: Image.asset(img),
            ),
          ),
        )
      ],
    );
  }
  Future<bool> _isTorchAvailable(BuildContext context) async {
    try {
      return await TorchLight.isTorchAvailable();
    } on Exception catch (_) {
      _showMessage(
        'Could not check if the device has an available torch',
        context,
      );
      rethrow;
    }
  }

  Future<void> _enableTorch(BuildContext context) async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      _showMessage('Could not enable torch', context);
    }
  }

  Future<void> _disableTorch(BuildContext context) async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      _showMessage('Could not disable torch', context);
    }
  }

  void _showMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
 }
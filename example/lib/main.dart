import 'package:crisp/crisp.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CrispMain crispMain;


  @override
  void initState() {
    super.initState();


    crispMain = CrispMain(
      websiteId: "testid",
      userToken: "kfdjalkdfjkf"
      // locale: 'pt-br',
    );

    crispMain.register(
      user: CrispUser(
        email: "leo@provider.com",
        avatar: 'https://avatars2.githubusercontent.com/u/16270189?s=200&v=4',
        nickname: "João Cardoso",
        phone: "5511987654321",
      ),
    );

    crispMain.setMessage("Hello world");

    crispMain.setSessionData({
      "order_id": "111",
      "app_version": "0.1.1",
    });
    requestMicrophonePermission();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Your brand'),
        ),
        body: CrispView(
          crispMain: crispMain,
          clearCache: false,
        ),
      ),
    );
  }
}


Future<void> requestMicrophonePermission() async {
  var status = await Permission.microphone.request();
  if (status.isGranted) {
    print("Microphone permission granted");
  } else {
    print("Microphone permission denied");
  }
}


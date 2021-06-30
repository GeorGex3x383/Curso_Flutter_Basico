

//SHA1: 6E:55:0E:25:2E:12:3C:8F:DE:DC:43:70:2A:4F:50:35:40:6F:CF:99

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = new StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler( RemoteMessage message) async {
    //print('background handler: ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'No data');
  }

  static Future _onMessageHandler( RemoteMessage message) async {
    //print('on Message handler: ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'No data');
  }
  
  static Future _onMessageOpenApp( RemoteMessage message) async {
    //print('onMessageOpenApp handler: ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['producto'] ?? 'No data');
  }

  static Future initializeApp() async{

    //Push Notification
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

  }

  static closeStreams(){
    _messageStream.close();
  }
}
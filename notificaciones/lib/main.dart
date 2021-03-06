import 'package:flutter/material.dart';
import 'package:notificaciones/src/pages/home_page.dart';
import 'package:notificaciones/src/pages/message_page.dart';
import 'package:notificaciones/src/services/push_notification_service.dart';
 
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());

}
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  @override
    void initState() {
      super.initState();

      //context
      PushNotificationService.messagesStream.listen((message) {
        //print('MyApp: $message');
        navigatorKey.currentState?.pushNamed('message', arguments: message);
        final snackBar = SnackBar(content: Text(message));
        messengerKey.currentState?.showSnackBar(snackBar);
      });
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey, //Navegar
      scaffoldMessengerKey: messengerKey, //Mostrar Snacks
      routes: {
        'home'    : (BuildContext context) => HomePage(),
        'message' : (BuildContext context) => MessagePage(),
      },
    );
  }
}
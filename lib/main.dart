import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:golinkcaller/src/pages/account.dart';
import 'package:golinkcaller/src/pages/call.dart';
import 'package:golinkcaller/src/pages/contact.dart';
import 'package:golinkcaller/src/pages/dialpad.dart';
import 'package:golinkcaller/src/pages/sms.dart';
import 'package:golinkcaller/src/utils/global.dart';
import 'package:golinkcaller/src/widgets/bottomtabs.dart';
import 'package:provider/provider.dart';
import 'package:sip_ua/sip_ua.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  if (WebRTC.platformIsDesktop) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  Global.init().then((e) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => RootProvider()),
          ],
          child: MyApp(),
        ),
      ));
}

// typedef PageContentBuilder = Widget Function(
//     [SIPUAHelper? helper, Object? arguments]);

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final SIPUAHelper _helper = SIPUAHelper();

  // Map<String, PageContentBuilder> routes = {
  //   '/': ([SIPUAHelper? helper, Object? arguments]) => BottomTabs(),
  //   "/dialpad": ([SIPUAHelper? helper, Object? arguments]) => DialPadPage(),
  //   '/sms': ([SIPUAHelper? helper, Object? arguments]) =>const SMSPage(),
  //   '/call': ([SIPUAHelper? helper, Object? arguments]) =>const CallPage(),
  //   '/contact': ([SIPUAHelper? helper, Object? arguments]) =>const ContactPage(),
  //   '/account': ([SIPUAHelper? helper, Object? arguments]) =>const AccountPage(),
  // };

  Map<String, Widget Function(BuildContext)> routes = {
    '/': (BuildContext context) => BottomTabs(),
    "/dialpad": (BuildContext context) => DialPadPage(),
    '/sms': (BuildContext context) => const SMSPage(),
    '/call': (BuildContext context) => const CallPage(),
    '/contact': (BuildContext context) => const ContactPage(),
    '/account': (BuildContext context) => const AccountPage(),
  };

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final Function? pageContentBuilder = routes[name!];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute<Widget>(
            builder: (context) =>
                pageContentBuilder(_helper, settings.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute<Widget>(
            builder: (context) => pageContentBuilder(_helper));
        return route;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '果链通',
      debugShowCheckedModeBanner: false, //取消debug图标
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      //routes: routes,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: FlutterEasyLoading(
            child: child,
          ),
        );
      },
      routes: routes,
      initialRoute: '/',
      onGenerateRoute: _onGenerateRoute,
    );
  }
}

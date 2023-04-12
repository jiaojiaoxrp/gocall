import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:golinkcaller/src/pages/account.dart';
import 'package:golinkcaller/src/pages/call.dart';
import 'package:golinkcaller/src/pages/contact.dart';
import 'package:golinkcaller/src/pages/dialpad.dart';
import 'package:golinkcaller/src/pages/sms.dart';
import 'package:golinkcaller/src/utils/global.dart';
import 'package:provider/provider.dart';

//定义底部菜单
class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  List<Widget> pageList = <Widget>[
    const CallPage(),
    const ContactPage(),
    const DialPadPage(),
    const SMSPage(),
    const AccountPage(),
  ];

  @override
  void initState() {
    super.initState();

    // EventBus.instance.addListener(EventKeys.logout, () {
    //   // 移除事件监听
    //   EventBus.instance.removeListener(EventKeys.logout);
    //   // 跳转登录页面
    //   Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false, arguments: {'isToken': true});
    // });
  }

  @override
  void dispose() {
    // 移除事件监听
    // EventBus.instance.removeListener(EventKeys.logout);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RootProvider>(builder: (_, __, ___) {
      int currentIndex =
          Provider.of<RootProvider>(context, listen: false).index;

      return Scaffold(
        body: pageList[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, //不加这个文字不显示
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: '通话',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: '联系人',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dialpad),
              label: '拨号',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sms),
              label: '短信',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的',
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: Color.fromARGB(255, 14, 28, 179),
          unselectedItemColor: Color.fromARGB(255, 96, 96, 99),
          onTap: (int index) {
            Provider.of<RootProvider>(context, listen: false)
                .changeIndex(index);
          },
        ),
      );
    });
  }
}

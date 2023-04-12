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
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
              icon: Icon(Icons.call),
              title: '通话',
            ),
            TabItem(
              icon: Icon(Icons.contacts),
              title: '联系人',
            ),
            TabItem(
              icon: Icon(Icons.dialpad),
              title: '拨号',
            ),
            TabItem(
              icon: Icon(Icons.sms),
              title: '短信',
            ),
            TabItem(
              icon: Icon(Icons.person),
              title: '我的',
            ),
          ],
          initialActiveIndex: currentIndex,
          height: 50,
          style: TabStyle.fixedCircle,
          onTap: (int index) {
            Provider.of<RootProvider>(context, listen: false)
                .changeIndex(index);
          },
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:my_flutter/page/PageViewFirst.dart';
import 'package:my_flutter/page/PageViewSecond.dart';
import 'package:my_flutter/page/PageViewThird.dart';
import 'package:my_flutter/view/MTabBarWidget.dart';

class MTabBarBottomWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new MTabBarBottomState();
  }

}

class MTabBarBottomState extends State<MTabBarBottomWidget>{

  //底部tab
  final PageController pageController = new PageController();
  final List<String> tabs = ["我的","发现","动态"];

  @override
  Widget build(BuildContext context) {
    return new MTabBarWidget(
      bgColor: Colors.blue,
      titleWidget: new Text("Sample"),
      pageChild: _pageView(),
      tabsChild: _bottomTab(),
      pageController: pageController,
    );
  }

  //主页面
  _pageView(){
    return[
      new PageViewFirst(),
      new PageViewSecond(),
      new PageViewThird(),
    ];
  }

  //底部导航
  _bottomTab(){
    List<Widget> widgetList = new List();
    for(int i = 0; i<tabs.length; i++){
      widgetList.add(
          new FlatButton(
            onPressed: (){
              pageController.jumpTo(MediaQuery.of(context).size.width*i);
              print("$i");
            },
            child: new Text(
              tabs[i],
              maxLines: 1,
            )
          )
      );
    }
    return widgetList;
  }
}
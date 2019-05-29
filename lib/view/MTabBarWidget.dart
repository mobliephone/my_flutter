import 'package:flutter/material.dart';

class MTabBarWidget extends StatefulWidget{

  MTabBarWidget({Key key, this.pageController
    , this.bgColor, this.titleWidget, this.pageChild
    , this.tabsChild}) : super(key:key);

  final PageController pageController;//子页面controller
  final Color bgColor;//appbar背景颜色
  final Widget titleWidget;//appbar标题
  final List<Widget> pageChild;//子页面
  final List<Widget> tabsChild;//底部导航

  //更新状态
  @override
  _MTabBarWidgetState  createState() => new _MTabBarWidgetState(pageController, bgColor
      , titleWidget, pageChild, tabsChild);
}

class _MTabBarWidgetState extends State<MTabBarWidget> with SingleTickerProviderStateMixin{

  _MTabBarWidgetState(this._pageController, this._bgColor,
      this._titleWidget, this._pageChild, this._tabsChild): super();
  final PageController _pageController;
  final Color _bgColor;
  final Widget _titleWidget;
  final List<Widget> _pageChild;
  final List<Widget> _tabsChild;


  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _tabsChild.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //头部
      appBar: new AppBar(
        backgroundColor: _bgColor,
        title: _titleWidget,
      ),
      //主页面
      body: new PageView(
        children: _pageChild,
        controller: _pageController,
        onPageChanged: (index){
          _tabController.animateTo(index);
        },
      ),
      //底部导航
      bottomNavigationBar: new Material(
        child: new TabBar(
          tabs: _tabsChild,
          controller: _tabController,
        ),
      ),
    );
  }



}
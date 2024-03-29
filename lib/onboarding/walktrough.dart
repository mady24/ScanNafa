import 'package:dashboard/onboarding/dot.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/onboarding/page1.dart';
import 'package:dashboard/onboarding/page2.dart';
import 'package:dashboard/onboarding/page3.dart';
import 'package:dashboard/onboarding/page4.dart';
import 'package:dashboard/onboarding/page5.dart';
import 'package:dashboard/onboarding/page6.dart';

class _WalkthroughScreen extends State<WalkthroughScreen> {
  final _controller = new PageController();
  List<Widget> _pages = [];
  String _link;
  int page = 0;

  @override
  void initState() {
    super.initState();
    widget.client == 'client' ? _pages = [
    Page1(),
    Page2(),
    Page3(),
  ] : _pages = [
    Page4(),
    Page5(),
    Page6(),
  ];
  widget.client == 'client' ? _link = "/login" : _link = "/loginvendeur";
  }

   onPressed(String routeName) {
      Navigator.of(context).pushNamed(routeName);
    }


  @override
  Widget build(BuildContext context) {
    bool isDone = page == _pages.length - 1;
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Stack(
        children: <Widget>[
          new Positioned.fill(
            child: new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
              onPageChanged: (int p){
                setState(() {
                  page = p;
                });
              },
            ),
          ),
          
          new Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: new SafeArea(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new DotsIndicator(
                      controller: _controller,
                      itemCount: _pages.length,
                      onPageSelected: (int page) {
                        _controller.animateToPage(
                          page,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                        width: 150.0,
                        height: 50.0,
                        
                        child: new Material(
                          child: MaterialButton(
                            child: Text('Passer',
                              style: Theme.of(context).textTheme.button.copyWith(color: Colors.black, fontFamily: 'Dosis', fontSize: 20.0),
                            ),
                            onPressed: () => onPressed(_link),
                            highlightColor: Colors.orange.withOpacity(0.5),
                            splashColor: Colors.orange.withOpacity(0.5),
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      new Container(
                        width: 150.0,
                        height: 50.0,
                        
                        child: new Material(
                          child: MaterialButton(
                            child: Text('Suivant',
                              style: TextStyle(color: Colors.black, fontFamily: 'Dosis', fontSize: 20.0),
                            ),
                            onPressed: () => {page = page+1},
                            highlightColor: Colors.white30,
                            splashColor: Colors.white30,
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}

class WalkthroughScreen extends StatefulWidget {
  WalkthroughScreen({Key key, this.client}) : super(key: key);

  String client;

  @override
  _WalkthroughScreen createState() => new _WalkthroughScreen();
}
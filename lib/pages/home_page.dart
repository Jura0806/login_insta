import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
 // const HomePage({Key? key}) : super(key: key);
  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late  Animation<Size> _animation;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 120));
    _animation = Tween<Size>(
      begin: Size(100,100),
      end: Size(120,120),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn)
    );

    _controller..addStatusListener((AnimationStatus status) {
      if(status == AnimationStatus.completed){
        _controller.repeat();
      }
    });

  }

   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Animation'),
    ),
      body: Center(
        child: AnimatedBuilder(
         animation: _animation,
          builder: (ctx,ch) => Container(
            width: _animation.value.width,
            height: _animation.value.height,
            child: Image.asset('assets/images/heart.png'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
         _controller.forward();
        },
      ),
    );
  }
}

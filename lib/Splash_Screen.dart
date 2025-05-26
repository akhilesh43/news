import 'package:flutter/material.dart';
import 'package:news_paper_app/Homescreen.dart';
import 'package:news_paper_app/login_Page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Future.delayed(const Duration(seconds: 5),(){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
   });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.8),
                Theme.of(context).primaryColor.withOpacity(0.6),
              ]
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(child: Opacity(opacity: 0.05,
         child: GridPattern(
           color: Colors.white,
         )),
            ),


            //main content
            Center(

              child: Column(
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<double>(tween: Tween(begin: 0.0, end: 1.0),duration: const Duration(milliseconds: 1200),builder: (context,value,child){
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0,4),
                                spreadRadius: 2,
                            )
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Icon(Icons.newspaper,size: 48,color: Theme.of(context).primaryColor),
                        ),
                      ),
                    );
                  },
                  ),
                SizedBox(height: 20,),
                  //TEXT Animation

                  //botom tagline
                  Positioned(
                      bottom: 48,
                      right: 0,
                      left: 0,

                      child: TweenAnimationBuilder<double>(tween: Tween(begin: 0.0, end: 1.0),duration: const Duration(milliseconds: 1200),builder: (context,value,child){
                        return Opacity(opacity: value,
                          child: Transform.translate(offset: Offset(0,20*(1-value)),
                              child:child
                          ),

                        );
                      },
                        child: Column(
                          children: [
                            Text("Latest fast news",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                letterSpacing: 4,
                              ),

                            ),
                          ],
                        ),


                      ),
                  ),


                  ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
class GridPattern extends StatelessWidget {
  final Color color;
  const GridPattern({
    Key? key,
    required this.color,
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GridPainter(color: color),
    );
  }
}
class GridPainter extends CustomPainter {
  final Color color;
 GridPainter({required this.color});
 
@override
 void paint(Canvas canvas, Size size) {
   final paint = Paint()..color = color
       ..strokeWidth = 0.5;
   final spacing = 20.0;

   for(var i = 0.0; i < size.width; i += spacing) {
canvas.drawLine(Offset(i,0), Offset(i,size.height), paint);
   }
   for(var i = 0.0; i < size.height; i += spacing) {
     canvas.drawLine(Offset(0,i), Offset(size.width,i), paint);
   }

 }
 @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


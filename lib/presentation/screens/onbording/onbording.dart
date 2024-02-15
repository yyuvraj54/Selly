import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sellingportal/presentation/screens/Auth/loginPage.dart';


import 'onbordingContent.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}


class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  PageController _controller=PageController(initialPage: 0);

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(


        child: PageView.builder(controller: _controller,
          itemCount: contents.length,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },itemBuilder: (_,i){
        return Container(width: MediaQuery.of(context).size.width, height: 100,

          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(contents[i].background),
              fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter),),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [ SvgPicture.asset(contents[i].image,height: 300,),
              Padding(padding: const EdgeInsets.fromLTRB(0,50,0,0),
                  child: Text(contents[i].discription,textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "poppins",fontSize: 20,fontWeight: FontWeight.bold ,color: Colors.white),),
              ),Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40,10,40,10),
                      child: Text(currentIndex == contents.length - 1 ? "Get Started" : "Next",style: TextStyle(fontFamily: "poppins",fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xFF4A43EC)),),
                    ), onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomeScreen(),
                      ),
                    );
                  }
                  _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
                  ),
              ),],
            ),
          ),
        );
      },),
    )
    );
  }
}
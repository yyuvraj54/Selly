import 'package:flutter/material.dart';
import 'package:sellingportal/res/colors/colors.dart';

class productPage extends StatelessWidget {
  productPage({super.key});

  Colours uiColor = Colours();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        backgroundColor: uiColor.primaryColor,
        actions: [Icon(Icons.shopping_cart),SizedBox(width: 10,)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(

          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    // color: Colors.red,
                    child: Center(
                      child: Container(

                        height: 270,
                        width: 270,
                        color: Colors.red,
                        child: Center(child: Text('Image')),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Prodct Name',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Center(
                          child: Container(
                            color: Colors.grey,
                            child: IconButton(
                              onPressed: () => {},
                              icon: Icon(Icons.share),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Prodct Detail',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Units:',style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(width: 10,),
                            Text('4'),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aliquet posuere molestie. Donec eu leo augue. Proin est dolorlit. Nam consectetur consectetur purus. Morbi at enim neque      Nunc varius ante a sollicitudin dapibus. Aliquam at leo sodales, placerat neque in, rhoncus ex. Praesent vitae arcu nec sem auctor bibendum at eget nisi. Morbi sed augue eu justo luctus condimentum in eu ipsum. Pellentesque quis lectus commodo, interdum nibh vitae, sollicitudin mi. Duis sollicitudin egestas vehicula. Phasellus sodales lacus eget auctor sollicitudin. Donec sit amet justo nec dolor iaculis porta. Mauris ultrices tristique elit, sed elementum velit blandit sed. Morbi cursus urna felis, eget dapibus felis cursus vitae. Praesent finibus porttitor dolor, tristique congue massa sollicitudin eu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla quis bibendum tellus, efficitur mattis dolor. Ut dapibus eu sapien id tristique. Praesent condimentum venenatis nunc. Vivamus aliquet in ipsum et tincidunt',
                          maxLines: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Text('MRP'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Rs 420',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 3, backgroundColor: uiColor.primaryColor),
                onPressed: () => {},
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

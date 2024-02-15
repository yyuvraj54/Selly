import 'package:flutter/material.dart';

import '../sellFormScreens/CustomInput.dart';
import '../sellFormScreens/image_display_container.dart';
import '../sellFormScreens/image_picker_button.dart';

class myAdsPage extends StatefulWidget {
  const myAdsPage({super.key});

  @override
  State<myAdsPage> createState() => _myAdsPageState();
}

class _myAdsPageState extends State<myAdsPage> {
  int currentStep = 0;

  List<String> _imagePaths = [];

  void _updateImagePaths(List<String> paths) {
    setState(() {
      _imagePaths = paths;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Stepper(
        type: StepperType.horizontal,
        currentStep: currentStep,
        onStepCancel: () => currentStep == 0 ? null : setState(() {
          currentStep -= 1;
        }),
        onStepContinue: () {
          bool isLastStep = (currentStep == getSteps().length - 1);
          if (isLastStep) {
            // Do something with this information
          } else {
            setState(() {
              currentStep += 1;
            });
          }
        },
        onStepTapped: (step) => setState(() {
          currentStep = step;
        }),
        steps: getSteps(),
      ),
    );
  }
  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text("BOOK INFO", style: commonTextsStyle()),
        content: Column(
          children: [
            CustomInput(hint: "Add title*", inputBorder: OutlineInputBorder(),),
            CustomInput(hint: "Describe the product*", inputBorder: OutlineInputBorder(),),
            CustomInput(hint: "Category*", inputBorder: OutlineInputBorder(),),
            CustomInput(hint: "Tags*", inputBorder: OutlineInputBorder(),),
            CustomInput(hint: "Quantity*", inputBorder: OutlineInputBorder(),),
            CustomInput(hint: "Mention use period*", inputBorder: OutlineInputBorder(),),
            CustomInput(hint: "Mention defects", inputBorder: OutlineInputBorder(),),
            CustomInput(hint: "Link to original product page", inputBorder: OutlineInputBorder(),),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text("Upload picture", style: commonTextsStyle()),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImagePickerButton(onImagesPicked: _updateImagePaths),
            SizedBox(height: 20),
            _imagePaths.isNotEmpty ? ImageDisplayContainer(imagePaths: _imagePaths, onDeleteImage: (int index) {
              setState(() {_imagePaths.removeAt(index);});},) : Container(),
          ],
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: Text("Set Price", style: commonTextsStyle()),
        content: Column(
          children: [
            CustomInput(hint: "Set Price* (In ₹)",  inputType: TextInputType.number,inputBorder: OutlineInputBorder(),),
          ],
        ),
      ),
    ];
  }

  TextStyle commonTextsStyle({Color color = Colors.black, double fontsize = 10.0}) {
    return TextStyle(
        fontSize: fontsize,
        color: color,
        fontWeight: FontWeight.normal,
        fontFamily: "Poppins");
  }
}



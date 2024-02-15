class OnbordingContent {
  String image;
  String background;
  String discription;


  OnbordingContent({
    required this.image,
    required this.discription,
    required this.background,

  });
}

List<OnbordingContent> contents = [
  OnbordingContent(
    image: "assets/images/RefImg.svg",
    background: "assets/images/back.png",
    discription: "Connect and trade items with students close to you.",

  ),
  OnbordingContent(
    image: "assets/images/bankingImg.svg",
    background: "assets/images/back2.png",
    discription: "Make Extra income from College materials you no longer have need for.",
  ),
];
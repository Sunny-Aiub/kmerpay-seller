
import 'package:flutter/material.dart';
import 'package:kmerpay_seller/auth/presentation/pages/sign_in_screen.dart';
import 'package:kmerpay_seller/resources/colors.dart';

import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../../../resources/widgets/kpbutton.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({Key? key}) : super(key: key);

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  int currentIndex = 0;
  List<SliderModel> slides = [];
  PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    slides = getSlides();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // PageView Builder
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  // Contents of Slider that we
                  // created in Modal Class
                  return Slider(
                    image: slides[index].getImage(),
                    title: slides[index].getTitle(),
                    description: slides[index].getDescription(),
                  );
                })
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0,top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                slides.length,
                    (index) => buildDot(index, context),
              ),
            ),
          ),
          
          // Container created for dots

          // Container(
          //   height: 52,
          //   margin: EdgeInsets.all(40),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     color: ColorManager.primaryBlue,
          //     borderRadius: BorderRadius.all(Radius.circular(4)),
          //   ),
          //   child: TextButton(
          //     child: Text(
          //          "Get Started",style: getTextStyle(16, FontWeight.w600, Colors.white),),
          //     onPressed: (){
          //       Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //             fullscreenDialog: true,
          //             builder: (context) =>
          //             const SignInScreen(), //const LandingScreen(),
          //           ));
          //     },
          //     // textColor: Colors.white,
          //     // shape: RoundedRectangleBorder(
          //     //   borderRadius: BorderRadius.circular(25),
          //     // ),
          //   ),
          //
          // ),
           CustomButton(
             buttonTitle: 'Get Started',color: ColorManager.primaryBlue,width: 120,
             trailing: Icon(PhosphorIcons.arrow_right,color: Colors.white,),
           )
        ],
      ),
    ));
  }

  Container buildDot(int index, BuildContext context) {
// Another Container returned
    return Container(
      height: 2,
      width: currentIndex == index ? 40 : 24,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: currentIndex == index ?ColorManager.brandColor:ColorManager.grey4,
      ),
    );
  }

  // Container buildButton() {
  //   return Container(
  //     height: 60,
  //     margin: EdgeInsets.all(40),
  //     width: double.infinity,
  //     color: Colors.green,
  //
  //     // Button
  //     child: ElevatedButton(
  //       child: const Text("Get Started"),
  //       style: ButtonStyle(
  //         backgroundColor: MaterialStateProperty.all(ColorManager.brandColor),
  //       ),
  //       onPressed: () {
  //         // if(currentIndex == slides.length - 1){
  //         //
  //         //   // Navigate to next screen
  //         //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Screen1()),
  //         //   );
  //         // }
  //         // _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
  //       },
  //
  //       // Border radius to button
  //       // shape: RoundedRectangleBorder(
  //       //   borderRadius: BorderRadius.circular(25),
  //       // ),
  //     ),
  //   );
  // }
}

class Slider extends StatelessWidget {
  String image, title, description;

//Constructor created
  Slider({super.key, required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 400,width: MediaQuery.of(context).size.width,
            child: Image(image: AssetImage(image),fit: BoxFit.fill,),),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(title,textAlign: TextAlign.left,
              style:getSemiBoldStyle(fontSize: 26, color: ColorManager.primaryBlack)
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 0),
          child: Text(description,textAlign: TextAlign.left,
              style: getRegularStyle( fontSize: 14,color: ColorManager.bluishGrey)),
        ),
      ],
    );
  }
}

class SliderModel {
  String? image;
  String? title;
  String? description;

// Constructor for variables
  SliderModel({this.title, this.description, this.image});

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getImage() {
    return image ?? '';
  }

  String getTitle() {
    return title ?? '';
  }

  String getDescription() {
    return description ?? '';
  }
}

// List created
List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel();

// Item 1
  sliderModel.setImage(AssetConstant.slider1);
  sliderModel.setTitle("Make Payments in a easier way than ever");
  sliderModel.setDescription(
      "It is a long established fact that a reader will be distracted by the readable content of a page.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

// Item 2
  sliderModel.setImage(AssetConstant.slider2);
  sliderModel.setTitle("Get Virtual Credit that you Can Use Everywhere");
  sliderModel.setDescription(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

// Item 3
  sliderModel.setImage(AssetConstant.slider3);
  sliderModel.setTitle("Take Digital Payment at Your Stores & Outlets");
  sliderModel.setDescription(
      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  return slides;
}
